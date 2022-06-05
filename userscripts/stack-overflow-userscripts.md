# UserScripts to Use while visiting Stackoverflow

Userscripts. They let you customize the appearance and behaviour of any website. But you need to read, understand, and trust the userscript, or you need to write your own userscripts.

Remove distractions. "#hot-network-questions"


	// ==UserScript==
	// @name         StackOverFlow-PureFlow
	// @namespace    http://tampermonkey.net/
	// @version      0.1
	// @description  Remove distractions
	// @author       You
	// @match        https://stackoverflow.com/*
	// @icon         https://www.google.com/s2/favicons?sz=64&domain=stackoverflow.com
	// @grant        none
	// ==/UserScript==

	(function() {
		'use strict';

		// Your code here...
		let style = '#hot-network-questions, .s-sidebarwidget, .everyonelovesstackoverflow, .js-report-ad-button-container, .js-freemium-cta, #nav-collective-discover, .flex--item.fs-fine.fc-light   { display:none;} ';

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

		function cleanUpStackoverflow() {

			let hireMe = document.querySelector("#hireme:not(.lb)");

			if (hireMe != null) {
				hireMe.remove();
			}

			// add a fresh one in so that errors are not created in their logs.
			let hireMe2 = document.querySelector("#hireme.lb");
			if (hireMe2 == null) {
				let hireMeElement = htmlToElement(`<div id='hireme' class='lb' style='display:none;'></div>`);
				document.getElementsByTagName("head")[0].appendChild(hireMeElement);
			}
		}

		function onLoop() {
			cleanUpStackoverflow();
		}

		function onceOnly() {

			addStyle(style);
			let hireMe = document.querySelector("#hireme:not(.lb)");

			if (hireMe != null) {
				hireMe.remove();
			}

			onLoop();
			setInterval(function () {
				onLoop();
			}, 3000);

		}
		function onReady() {
			// Ok... i have this LONG wait... because i haven't worked out when the page really loads
			setTimeout(function () {
				onceOnly();
			}, 1500);
		}

		// Start modifying the page once the DOM is ready.
		if (document.readyState !== 'loading') {
			onReady();
		} else {
			document.addEventListener('DOMContentLoaded', onReady);
		}

	})();

## See also

- [Custom Style Tags on Azure Devops Sprint Board](../azure_devops/custom_style_tags.md)
