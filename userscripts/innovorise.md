# UserScripts to Use while using innovorise

Userscripts. They let you customize the appearance and behaviour of any website. But you need to read, understand, and trust the userscript, or you need to write your own userscripts.

## Custom colors for tags at innovorise



	// ==UserScript==
	// @name         innovorise tags
	// @namespace    http://tampermonkey.net/
	// @version      2025-10-20
	// @description  tags
	// @author       leon bambrick
	// @match        https://app.innovorise.com/*
	// @icon         https://www.google.com/s2/favicons?sz=64&domain=innovorise.com
	// @grant        none
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
			/* <div data-v-31c8f207="" class="table_tag d-inline-block">diagnosis ethics masterclass</div>*/
			// .table_tag:not(.lb_altered)  [data-content='']

			for (let tagBox of document.querySelectorAll(".table_tag:not(.lb_altered)")) {
				// add the lb_altered class, so that this element will only be altered/changed one time.
				tagBox.classList.add("lb_altered");

				let tagName = tagBox.innerText;

				if (tagName.length < 100) {
					// this allows us to set style rules such as `.tag-box[data-content="blocked"]::after { content: " ❌";}`
					tagBox.setAttribute('data-content', tagName.toLowerCase());
				}

				// tags starting with 'customer' (and the 'wiki' tag) are given helpful url links to our wiki
				/*if (tagName.toLowerCase().indexOf("customer") == 0 || tagName.toLowerCase() == "wiki") {
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
				}*/
			}

			// Special modifications to Card titles happen here
	// 		for (let cardTitleLink of document.querySelectorAll(".clickable-title:not(.lb_altered),.witTitle:not(.lb_altered)")) {
	// 			cardTitleLink.classList.add("lb_altered");
	// 			let cardTitle = cardTitleLink.innerText;

	// 			// We look for numbers in square brackets, with or without a hash at the start
	// 			// and turn them into links in our other system
	// 			if (cardTitle.match(/\[((#)*[0-9]+)\]/)) {
	// 				let idNum = cardTitle.match(/\[(#)*([0-9]+)\]/)[2];
	// 				// Url pattern: https://supportsystem.com/?id=123
	// 				let supportUrl = `https://supportsystem.com/?id=${idNum}`;
	// 				let supportLink = htmlToElement(`<a href='${supportUrl}' target='_blank' title='Open support system #${idNum} in a new window'>[#${idNum}]</a>`);

	// 				// Card titles are shown in a few different places... so rewriting the card title is a little tricky.
	// 				if (cardTitleLink.classList.contains("witTitle")) {
	// 					// unexpanded card... add the link as a sibling
	// 					cardTitleLink.parentNode.insertBefore(supportLink, cardTitleLink);
	// 				} else {
	// 					// normal card... add the link as a young great-aunt.
	// 					cardTitleLink.parentNode.parentNode.insertBefore(supportLink, cardTitleLink.parentNode);
	// 				}
	// 				console.log(`Link for ${idNum}`);
	// 			}
	// 			cardTitleLink.innerText = cardTitle.replace(/\[(#)*([0-9]+)\]/, ' ');// remove the number from the title since it appears in the preceeding link
	// 			// Consider: .replace("URGENT", "🔥URGENT🔥");
	// 		}
		}

		// this is called, once only, when the page is first loaded.
		function onceOnly() {
			// Special styles we apply.
			// .table_tag[data-content='']
			var styles = '.table_tag[data-content="beta particpant"] { background-color: hsl(172deg 100% 87%);}';
			styles += ' .table_tag[data-content="hp-newsletter"] { background-color: hsl(86deg 80% 99%);}';
			styles += ' .table_tag[data-content="hp-newsletter"]::after { content: " 📰";text-shadow:1px 1px 1px #000;}';
			styles += ' .table_tag[data-content="beta particpant"]::after { content: " ⭐";text-shadow:1px 1px 1px #000;}';
			
			
			// styles += ' .table_tag[data-content="break-in"] { box-shadow: 0 0 3px red;}';
															 
			addStyle(styles);

			// And now we set up the loop that will call "onLoop" over and over.
			// this is needed because elements are continually added/removed 
			// as you open/close/scroll/interact with the page
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
		//console.log("innovorise");
	}());
