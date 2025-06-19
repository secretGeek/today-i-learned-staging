# Using browser's Dev Tools to collect elements from a page

Example -- you want to grab all of the `h2` headings from the current page.

Use the browser's dev tools (available with key Function 12,  `F12`) -- and enter this command in the console:

	let s = []; document.querySelectorAll("h2").forEach(function (el) { s.push(el.innerText);}); copy(s.join("\n"));

You may use different selectors instead for other text.

## Source

- [Extracting a Trello board as markdown (secretGeek.net)](https://secretgeek.net/trello_ws) This is a variation on something I wrote about previously here. But many people use this kind of technique in all sorts of ways. I haven't seen very much written on it.


## See also

- [Useful bookmarklets](../bookmarkets/useful_bookmarklets.md)