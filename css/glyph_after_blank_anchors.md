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

[this link should have a north east arrow after it](../css/glyph_after_blank_anchors.md){#sample}

Here's a different technique -- using a bit of svg.

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

- [this link should have an svg box and arrow glyph after it](../css/glyph_after_blank_anchors.md){#sample2}

The problem here is that the color is set in the SVG. But we want to be able to set the color dynamically, using our dark/light theme. So I've altered it to use a different technique...

	a[target="_blank"]::after {
		content: "";
		width: 1.1em;
		height: 1.1em;
		margin: 0 0.1em 0 0.1em;
		background-size: contain;
		display: inline-block;
		background-color:var(--link);
		--svg: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ij48cGF0aCBkPSJNOSAyTDkgMyAxMi4zIDMgNiA5LjMgNi43IDEwIDEzIDMuNyAxMyA3IDE0IDcgMTQgMlpNNCA0QzIuOSA0IDIgNC45IDIgNkwyIDEyQzIgMTMuMSAyLjkgMTQgNCAxNEwxMCAxNEMxMS4xIDE0IDEyIDEzLjEgMTIgMTJMMTIgNyAxMSA4IDExIDEyQzExIDEyLjYgMTAuNiAxMyAxMCAxM0w0IDEzQzMuNCAxMyAzIDEyLjYgMyAxMkwzIDZDMyA1LjQgMy40IDUgNCA1TDggNSA5IDRaIi8+PC9zdmc+) no-repeat;
		/* Chrome, still requires prefix in 2022 */
		-webkit-mask: var(--svg);
		/* Firefox and Safari */
		mask: var(--svg);
		vertical-align: text-top;
		top: -0.5em;
		opacity:0.5;
	}

	a[target="_blank"]:hover::after {
		opacity:1.0;
	}

There's a *lot* going on there.

First: We use a variable to hold the `--svg` so that when we use it *twice* we don't have to write it out twice.

Next -- instead of setting the background, we set the "mask". This means our svg does not draw the glyph: it draws a glyph shaped hole. The hole is colored according to the `background` property.

Finally, I've lowered the opacity, and then on hover, bring it back to 100%;

<style>
a#sample3:hover::after {
opacity:1.0;
}
a#sample3::after {
opacity:0.5;
content: "";
width: 1.1em;
height: 1.1em;
margin: 0 0.1em 0 0.1em;
background-size: contain;
display: inline-block;
background-color:var(--link);
--svg: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNiAxNiIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ij48cGF0aCBkPSJNOSAyTDkgMyAxMi4zIDMgNiA5LjMgNi43IDEwIDEzIDMuNyAxMyA3IDE0IDcgMTQgMlpNNCA0QzIuOSA0IDIgNC45IDIgNkwyIDEyQzIgMTMuMSAyLjkgMTQgNCAxNEwxMCAxNEMxMS4xIDE0IDEyIDEzLjEgMTIgMTJMMTIgNyAxMSA4IDExIDEyQzExIDEyLjYgMTAuNiAxMyAxMCAxM0w0IDEzQzMuNCAxMyAzIDEyLjYgMyAxMkwzIDZDMyA1LjQgMy40IDUgNCA1TDggNSA5IDRaIi8+PC9zdmc+) no-repeat;
/* Chrome, still requires prefix in 2022 */
-webkit-mask: var(--svg);
/* Firefox and Safari */
mask: var(--svg);
vertical-align: text-top;
top: -0.5em;
}
a#sample2:active:after{
background-color:var(--link-active);
}
a#sample2:visited:after{
background-color:var(--link-visited);
}
a#sample2:hover:after {
background-color:var(--link-hover);
background-color:white;
opacity:1.0;
}
</style>

- [this link should have an svg box and arrow glyph after it](../css/glyph_after_blank_anchors.md){#sample3}

 Here's the svg, decoded:

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="16" height="16"><path d="M9 2L9 3 12.3 3 6 9.3 6.7 10 13 3.7 13 7 14 7 14 2ZM4 4C2.9 4 2 4.9 2 6L2 12C2 13.1 2.9 14 4 14L10 14C11.1 14 12 13.1 12 12L12 7 11 8 11 12C11 12.6 10.6 13 10 13L4 13C3.4 13 3 12.6 3 12L3 6C3 5.4 3.4 5 4 5L8 5 9 4Z"/></svg>
```

## Sources

- [Paul at stackoverflow](https://stackoverflow.com/a/65370632/49)
- [Proposal to encode an External Link Sign - at unicode](https://www.unicode.org/L2/L2006/06268-ext-link.pdf)
- [Set Fill Color of SVG Background-image](https://pqina.nl/blog/set-svg-background-image-fill-color/)

## See also

- [How to implement dark mode with css](dark_mode_css.md)
- [CSS Variables are cool](https://secretgeek.net/var_hue)
