# Replace Text with Property Values

This is a strange idea I had for a web developer tool.

I've written a script that will replace every piece of text on a page with the value of any css property you select.

**==Try it out==**{.select-here }

For example, if you pick the property `font-family` then it will replace every heading, every paragraph, ever word, with the name of the font that is used in that part of the page.

> A blockquote will be selected with the values of that CSS property within the blockquote

An a piece of ==marked== text will be replaced with the values of the selected property as well.

You will be able to see the different **font-weight** of **bold** text and the different *font-style* of *emphasized* text.

| You | can |look  |at  |the  |
|-----|-----|------|----|-----|
| different | borders  |in  | tables | or |
| explore | padding | and | margins | too |

I'd like to wrap this technique into a `bookmarklet` (aka `favelet`) but not tonight.

There are two key pieces of code:

1. A tree walker (created with `document.createTreeWalker`) for visiting every element of the page, looking particularly for text
2. The use of `getComputedStyle` to find the array of styles that have been applied to each piece of text. (Technically: to the parent of each piece of text)

Here's the central function:

```javascript
function replaceAllTextWithStylePropertyValue(propertyName) {
	var walker = document.createTreeWalker(
			document.body,  // root node
			NodeFilter.SHOW_TEXT,  // filtering only text nodes
			null,
			false
	);

	while (walker.nextNode()) {
		if (walker.currentNode.nodeValue.trim()) { // if it's not empty(whitespaced) node

			// Don't alter a node if it has an ancestor with a class of 'protected'
			if (walker.currentNode.parentNode.closest('.protected') == null) {
				let length = walker.currentNode.nodeValue.length;
				let newText = getComputedStyle(walker.currentNode.parentNode)[propertyName] + " ";
				let newLength = newText.length;
				walker.currentNode.parentNode.setAttribute("title", `${propertyName}: ${newText.trim()}`);
				walker.currentNode.nodeValue = newText.repeat(Math.ceil(length / newLength)).substring(0, length);
			}
		}
	}
}
```

That's enough strangeness for one evening.

<script>
function replaceAllTextWithStylePropertyValue(propertyName) {
	var walker = document.createTreeWalker(
			document.body,  // root node
			NodeFilter.SHOW_TEXT,  // filtering only text nodes
			null,
			false
	);

	while (walker.nextNode()) {
		if (walker.currentNode.nodeValue.trim()) { // if it's not empty(whitespaced) node
			let length = walker.currentNode.nodeValue.length;
			if (walker.currentNode.parentNode.closest('.protected') == null) {
				let newText = getComputedStyle(walker.currentNode.parentNode)[propertyName] + " ";
				let newLength = newText.length;
				walker.currentNode.parentNode.setAttribute("title", `${propertyName}: ${newText.trim()}`);
				walker.currentNode.nodeValue = newText.repeat(Math.ceil(length / newLength)).substring(0, length);
			}
		}
	}
}

function createPropertyList() {
	let dd = htmlToElement('<div class="protected">Select Property <select name="propertyNames" id="propertyNames"></select></div>');

	$('.select-here')[0].appendChild(dd);
	//document.body.appendChild(dd);
	const props = $id('propertyNames');
	addOption(props, "(pick one)");
	for(const pp of getComputedStyle(document.body)) {
		addOption(props, pp);
	}
	props.addEventListener('change', function(e) {
		if (this.value != "(pick one)") {
			replaceAllTextWithStylePropertyValue(this.value);
		}
	});
}

function addOption(props, text) {
	let option = document.createElement("option");
	option.text = text;
	option.value = text;
	props.add(option);
}

/* ####################### */
/* ####################### */
/* ## utility functions ## */
/* ####################### */
/*    #################    */
/*       ###########       */
/*          #####          */
/*            #            */

function $(selector) {
	return document.querySelectorAll(selector);
}

function $id(id) {
	return document.getElementById(id);
}

function htmlToElement(html) {
	var template = document.createElement("template");
	html = html.trim(); // Never return a text node of whitespace as the result
	template.innerHTML = html;
	return template.content.firstChild;
}

/*            #            */
/*          #####          */
/*       ###########       */
/*    #################    */
/* ####################### */
/* ## utility functions ## */
/* ####################### */
/* ####################### */


createPropertyList();

</script>
<style class='protected'>
.protected {
margin: 0 auto;
text-align:center;
}
</style>

## See also

- [Css Properties of Current Page](css_properties_of_current_page.md)