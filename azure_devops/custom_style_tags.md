# Custom Style Tags on Azure Devops Sprint Board

On a kanban board you can use custom rules to color the `tags`.

On a sprint board, custom rules will only color the entire card, not the tags themselves.

(Vote for this feature: [Add colored tags to sprint board/backlog - Visual Studio Feedback](https://developercommunity.visualstudio.com/t/add-colored-tags-to-sprint-boardbacklog/365646) if you too want to customize the colors of the tags themselves.)


If you can find a way to inject CSS into the board, you can use rules like this to set custom colors for the labels themselves.

Say you want the `BLOCKED` tag to be fire-engine red. Here is how it's done:

	<style>
		.tags-items-container[aria-label~='BLOCKED'] .tag-box {background-color:red}
	</style>

The `~=` means "contains the word".


Or, perhaps you have various tags that "start with" a prefix, such as "customer-" -- you can select those tags and style them blue with a rule like this:

	<style>
		.tags-items-container[aria-label*='Customer'] .tag-box {background-color:blue}
	</style>

The `*=` means "contains".


For reference, here's the html they use for the container of the tags, and the tags themselves. This is on a card with two tags, `BLOCKED` and `Customer-Pepsi`.


	<div class="tags field-container" field="System.Tags">
		<div id="vss_549" class="tfs-tags">
			<div class="tags-items-container" role="toolbar" aria-label="BLOCKED,Customer-Pepsi">
				<ul>
					<li class="tag-item" index="0">
						<span class="tag-container" dir="ltr">
							<span class="tag-box" dir="ltr">BLOCKED</span>
						</span>
					</li>
					<li class="tag-item" index="1">
						<span class="tag-container" dir="ltr">
							<span class="tag-box" dir="ltr">Customer-Pepsi</span>
						</span>
					</li>
				</ul>
			</div>
		</div>
	</div>


Actually, I see now that my rules would select *all* tags on a card, even though I only want to highlight the *relevant* tag.

Unless they improve their html (for example by adding `data-tag-name="BLOCKED"` onto the `.tag-box` itself, there's no simple CSS selector that will do it (we can't select by content.) 

If I can add custom javascript to the page, I can use the same technique described here: [CSS: Select by content (by selecting by attribute value, with help from javascript)](../css/select_by_attribute.md).

Here's an example of someone with a bunch of "violentmonkey" userscripts: [GitHub - alejandro5042/azdo-userscripts: A collection of userscripts to improve the Azure DevOps UI](https://github.com/alejandro5042/azdo-userscripts). I assume "violentmonkey" is a modern ancestor of "greasemonkey", a firefox plugin that let you run custom scripts at different domains.


## My UserScript


And here's a userscript I made, for a chrome extension called "tampermonkey" which does what I want (for now)


	// ==UserScript==
	// @name         Azure Devops Tag Colors
	// @namespace    http://secretGeek.net/
	// @version      0.1
	// @description  Alters the html of the azure devops board, such that you can use Css selectors to color/style the tags on cards
	// @author       Leon B
	// @match        https://dev.azure.com/*
	// @run-at       document-body
	// @icon         https://cdn.vsassets.io/content/icons/favicon.ico
	// ==/UserScript==

	(function() {
		'use strict';

		// Function to add style element
		function addStyle(styles) {
			// Create style document
			var styleElement = document.createElement('style');
			styleElement.type = 'text/css';
			if (styleElement.styleSheet) {
				styleElement.styleSheet.cssText = styles;
			} else {
				styleElement.appendChild(document.createTextNode(styles));
			}
			// Append style tag to the head
			document.getElementsByTagName("head")[0].appendChild(styleElement);
		}

		// create a new element, based on html
		function htmlToElement(html) {
			var template = document.createElement("template");
			html = html.trim(); // Never return a text node of whitespace as the result
			template.innerHTML = html;
			return template.content.firstChild;
		}

		// given an element, insert a sibling after it
		function insertSibling(currentElem, newElem) {
			if (currentElem.nextSibling) {
				currentElem.parentNode.insertBefore(newElem, currentElem.nextSibling);
			} else {
				currentElem.parentNode.appendChild(newElem);
			}
		}

		// this function is called continuously, every few seconds. So any changes it makes have to be idempotent
		function onLoop() {
			// find every tag (unless it has the `lb_altered` class (indicating we've already found it and altered it.)
			for (let tagBox of document.querySelectorAll(".tag-box:not(.lb_altered)")) {
				// add the lb_altered class, so that this element will only be altered/changed one time.
				tagBox.classList.add("lb_altered");

				let tagName = tagBox.innerText;

				if (tagName.length < 100) {
					// this allows us to set style rules such as `.tag-box[data-content="blocked"]::after { content: " ❌";}`
					tagBox.setAttribute('data-content', tagName.toLowerCase());
				}

				// tags starting with 'customer' (and the 'wiki' tag) are given helpful url links to our wiki
				if (tagName.toLowerCase().indexOf("customer") == 0 || tagName.toLowerCase() == "wiki") {
					// if it's not a specific customer tag, then this general url to the customers overview is used.
					let customUrl = "https://intranet/wiki/customers/";

					if (tagName.toLowerCase() == "customer-1") {
						customerUrl = "https://intranet/wiki/customers/customer-1";
					}
					if (tagName.toLowerCase() == "customer-2") {
						customerUrl = "https://intranet/wiki/customers/customer-2";
					}
					if (tagName.toLowerCase() == "wiki") {
						customerUrl = "https://intranet/wiki/";
					}

					let customerLink = htmlToElement(`<a href='${customerUrl}' target='_blank' class='lb_wiki_link' title='Open page about #${tagName} in a new window'>&#10064;</a>`);
					tagBox.parentNode.appendChild(customerLink);
				}
			}

			// Special modifications to Card titles happen here
			for (let cardTitleLink of document.querySelectorAll(".clickable-title:not(.lb_altered),.witTitle:not(.lb_altered)")) {
				cardTitleLink.classList.add("lb_altered");
				let cardTitle = cardTitleLink.innerText;

				// We look for numbers in square brackets, with or without a hash at the start
				// and turn them into links in our other system
				if (cardTitle.match(/\[((#)*[0-9]+)\]/)) {
					let idNum = cardTitle.match(/\[(#)*([0-9]+)\]/)[2];
					// Url pattern: https://supportsystem.com/?id=123
					let supportUrl = `https://supportsystem.com/?id=${idNum}`;
					let supportLink = htmlToElement(`<a href='${supportUrl}' target='_blank' title='Open support system #${idNum} in a new window'>[#${idNum}]</a>`);

					// Card titles are shown in a few different places... so rewriting the card title is a little tricky.
					if (cardTitleLink.classList.contains("witTitle")) {
						// unexpanded card... add the link as a sibling
						cardTitleLink.parentNode.insertBefore(supportLink, cardTitleLink);
					} else {
						// normal card... add the link as a young great-aunt.
						cardTitleLink.parentNode.parentNode.insertBefore(supportLink, cardTitleLink.parentNode);
					}
					console.log(`Link for ${idNum}`);
				}
				cardTitleLink.innerText = cardTitle.replace(/\[(#)*([0-9]+)\]/, ' ');// remove the number from the title since it appears in the preceeding link
				// Consider: .replace("URGENT", "🔥URGENT🔥");
			}
		}

		// this is called, once only, when the page is first loaded.
		function onceOnly() {
			// Special styles we apply.
			var styles = ' .tag-box[data-content="blocked"]::after { content: " ❌";text-shadow:1px 1px 1px #000;}';
			styles += ' .tag-box[data-content="break-in"] { box-shadow: 0 0 3px red;}';
			styles += ' .tag-box[data-content="break-in"]::after { content: " 💥";text-shadow:1px 1px 1px #000;}';
			styles += ' .tag-box[data-content*="customer"] { background-color: blue;}';
			styles += ' .tag-box[data-content="wiki"]::after { content: " ➕";text-shadow:1px 1px 1px #000; }';
			styles += ' .tag-box[data-content="wiki"] { background-color: hsl(108deg 52% 60%);color:black;box-shadow:0 0 3px inset black}';
			// Customer specific colors
			styles += ' .tag-box[data-content="customer-1"] { background-color: hsl(172deg 100% 17%);}';
			styles += ' .tag-box[data-content="customer-2"] { background-color: hsl(40deg 96% 61%);color:black;}';
			styles += ' .lb_wiki_link { padding:2px 2px; background-color:#444; font-size:12px; }';

			addStyle(styles);

			// And now we set up the loop that will called "onLoop" over and over.
			// this is needed because elements are continually added/removed as you open/close/scroll/interact with the page
			// the loop is only called once every 3 seconds because i don't want to cause performance issues.
			setInterval(function () {
				onLoop();
			}, 3000);
		}

		function onReady() {
			// wait a few seconds so the page can load
			setTimeout(function () {
				onceOnly();
			}, 3000);
		}

		// Start modifying the page once the DOM is ready.
		if (document.readyState !== 'loading') {
			onReady();
		} else {
			document.addEventListener('DOMContentLoaded', onReady);
		}
	}());



## References

- [Customize a sprint taskboard in Azure Boards - Azure Boards | Microsoft Docs](https://docs.microsoft.com/en-us/azure/devops/boards/sprints/customize-taskboard?view=azure-devops)
- [Customize cards on a Kanban board - Azure Boards | Microsoft Docs](https://docs.microsoft.com/en-us/azure/devops/boards/boards/customize-cards?view=azure-devops)
- [Samples overview - Azure DevOps | Microsoft Docs](https://docs.microsoft.com/en-us/azure/devops/extend/develop/samples-overview?view=azure-devops)
- [GitHub - alejandro5042/azdo-userscripts: A collection of userscripts to improve the Azure DevOps UI](https://github.com/alejandro5042/azdo-userscripts)
- [Tampermonkey - chrome extension](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo?hl=en)

## See also

- [CSS: Select by content (by selecting by attribute value, with help from javascript)](../css/select_by_attribute.md)
- [A Bookmarklet or Favelet to Calculate "Total Points" in Azure Devops when Working on Backlog](favelet_to_calculate_total_points.md)
- [Copy element to clipboard](../javascript/copy_element_to_clipboard.md)