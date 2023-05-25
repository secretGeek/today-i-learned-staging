# How to show a little arrow glyph after 'target="_blank"' anchors

What I wanted was a visual indication of which urls would open in a new window.

I found a pure css solution, that didn't require altering the html at all.

	a[target="_blank"]::after {
		content: " \2197";
		font-size:0.7em;
		position: relative;
		vertical-align: baseline;
		top: -0.5em;
	}

This means:

	any `<a>` element with `target="_blank"`
	 - should have a small "North East Arrow" after it.

Here's an example:

<style>
a#sample::after {
	content: " \2197";
	font-size:0.7em;
	position: relative;
    vertical-align: baseline;
    top: -0.5em;
}
</style>


[this link should have a north east arrow after it](https://TIL.secretgeek.net){#sample}


Here's a different technique -- using a bit of svg...


	a[target="_blank"]::after {
		content: "";
		width: 1em;
		height: 1em;
		margin: 0 0.05em 0 0.1em;
		background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ij48cGF0aCBkPSJNOSAyTDkgMyAxMi4zIDMgNiA5LjMgNi43IDEwIDEzIDMuNyAxMyA3IDE0IDcgMTQgMlpNNCA0QzIuOSA0IDIgNC45IDIgNkwyIDEyQzIgMTMuMSAyLjkgMTQgNCAxNEwxMCAxNEMxMS4xIDE0IDEyIDEzLjEgMTIgMTJMMTIgNyAxMSA4IDExIDEyQzExIDEyLjYgMTAuNiAxMyAxMCAxM0w0IDEzQzMuNCAxMyAzIDEyLjYgMyAxMkwzIDZDMyA1LjQgMy40IDUgNCA1TDggNSA5IDRaIi8+PC9zdmc+) no-repeat;
		background-size: contain;
		display: inline-block;
		vertical-align: text-bottom;
	}



<style>
a#sample2::after {
content: "";
width: 1em;
height: 1em;
margin: 0 0.05em 0 0.1em;
background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ij48cGF0aCBkPSJNOSAyTDkgMyAxMi4zIDMgNiA5LjMgNi43IDEwIDEzIDMuNyAxMyA3IDE0IDcgMTQgMlpNNCA0QzIuOSA0IDIgNC45IDIgNkwyIDEyQzIgMTMuMSAyLjkgMTQgNCAxNEwxMCAxNEMxMS4xIDE0IDEyIDEzLjEgMTIgMTJMMTIgNyAxMSA4IDExIDEyQzExIDEyLjYgMTAuNiAxMyAxMCAxM0w0IDEzQzMuNCAxMyAzIDEyLjYgMyAxMkwzIDZDMyA1LjQgMy40IDUgNCA1TDggNSA5IDRaIi8+PC9zdmc+) no-repeat;
background-size: contain;
display: inline-block;
vertical-align: text-bottom;
}
</style>

[this link should have an svg box and arrow glyph after it](https://TIL.secretgeek.net){#sample2}
  
 
 
## Sources

- [paul at stackoverflow](https://stackoverflow.com/a/65370632/49)
- [Proposal to encode an External Link Sign - at unicode](https://www.unicode.org/L2/L2006/06268-ext-link.pdf)