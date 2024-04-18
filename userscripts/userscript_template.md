# Template for a UserScript

Here is a "batteries included" template for a user script.

It includes some little functions for adding elements and styles. And it sets up a loop to continually alter the page. This is needed on complex pages where elements are continually added/removed as you open/close/scroll/interact with the page.

You

	// ==UserScript==
	// @name         NAME
	// @namespace    http://secretGeek.net/
	// @version      0.1
	// @description  DESCRIPTION
	// @author       Leon Bambrick
	// @match        https://example.com/*
	// @match        https://www.example.com/*
	// @run-at       document-body
	// @icon         https://cdn.vsassets.io/content/icons/favicon.ico
	// ==/UserScript==

	/* global eus */

	(function() {
		'use strict';
		/* Function to add style element */
		function addStyle(styles) {
			/* Create style document */
			var styleElement = document.createElement('style');
			styleElement.type = 'text/css';
			if (styleElement.styleSheet) {
				styleElement.styleSheet.cssText = styles;
			} else {
				styleElement.appendChild(document.createTextNode(styles));
			}
			/* Append style tag to the head */
			document.getElementsByTagName("head")[0].appendChild(styleElement);
		}

		/* function create a new element, based on html */
		function htmlToElement(html) {
			var template = document.createElement("template");
			html = html.trim(); // Never return a text node of whitespace as the result
			template.innerHTML = html;
			return template.content.firstChild;
		}

		/* given an element, insert a sibling after it */
		function insertSibling(currentElem, newElem) {
			if (currentElem.nextSibling) {
				currentElem.parentNode.insertBefore(newElem, currentElem.nextSibling);
			} else {
				currentElem.parentNode.appendChild(newElem);
			}
		}

		/* this function is called continuously, every few seconds. So any changes it makes have to be idempotent */
		function onLoop() {
			/* Example: find every tag (unless it has the `lb_altered` class (indicating we've already found it and altered it.)
			for (let targetElement of document.querySelectorAll(".some-class:not(.lb_altered)")) {
				targetElement.classList.add("lb_altered"); // add the lb_altered class, so that this element will only be altered/changed oncee.
				// ** Do something to the targetElement...
			}
			*/

			/* ** Example: remove a particular element
			let hireMe = document.querySelector("#hireme");

			if (hireMe != null) {
              hireMe.remove();
			}
			*/

			/*
			 YOUR CODE HERE!
			*/
		}

		/* this is called, once only, when the page is first loaded. */
		function onceOnly() {
			// Special styles we apply.
			var styles = '.lb_altered { background-color:red;}';
			/*
			  YOUR STYLES HERE...
			*/
			styles += ' .bolt-pill { padding: 0 2px; }';

			addStyle(styles);
			// And now we set up the loop that will call "onLoop" over and over.
			// this is needed at sites where elements are continually added/removed as you open/close/scroll/interact with the page
			// the loop is only called once every 3 seconds because i don't want to cause performance issues.
			onLoop();
			setInterval(function () {
				onLoop();
			}, 3000);
		}

		function onReady() {
			// At the start... i have this LONG wait... because i haven't worked out when the page really loads
			setTimeout(function () {
				onceOnly();
			}, 2000);
		}

		// Start modifying the page once the DOM is ready.
		if (document.readyState !== 'loading') {
			onReady();
		} else {
			document.addEventListener('DOMContentLoaded', onReady);
		}
	}());


I have userscripts to:

- [Make Azure Devops look and act the way I want](../azure_devops/custom_style_tags.md)
- [Remove distractions from Stackoverflow](stack-overflow-userscripts.md)

I want user scripts to:

- Make all tables sortable (see [Sortable Table (with Vanilla JS)](../javascript/sortable_table.md))
- Make all pre and code elements "copy and paste" ready. (see [Copy element to clipboard](../javascript/copy_element_to_clipboard.md))
- Make documents example/collapse around each H1/h2/h3 -- be outline ready.
- Have a table of contents (see this bookmarketlet: [Table of Contents of a page - Useful bookmarklets](../bookmarklets/useful_bookmarklets.md#table-of-contents-of-a-page))
- Remember which elements I like to delete from each domain. (And help me choose a good CSS selector for doing so)


## See also

- [Css Properties of Current Page](../css/css_properties_of_current_page.md)
- [How to implement dark mode with css](../css/dark_mode_css.md)
- [Replace Text with Property Values](../css/replace_text_with_property_values.md)
- [CSS: Select by content (by selecting by attribute value, with help from javascript)](../css/select_by_attribute.md)
- [Sortable Table (with Vanilla JS)](../javascript/sortable_table.md)
- [Copy element to clipboard](../javascript/copy_element_to_clipboard.md)
- [Table of Contents of a page - Useful bookmarklets](../bookmarklets/useful_bookmarklets.md#table-of-contents-of-a-page))
- [Custom Style Tags on Azure Devops Sprint Board](../azure_devops/custom_style_tags.md)