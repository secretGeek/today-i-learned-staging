# Simple D3 Example

"D3.js" -- D3 means "Data-Driven Documents"

Essentially it maps data to DOM elements. DOM elements includes Divs, span, p, etc, but also (more commonly) SVGs (rectangles etc) and canvas.

## Link to the D3 library

```html
<script src="https://d3js.org/d3.v5.min.js"></script>
```

Find an element and append some `svg` to it...

Given:

```html
<div id="chart"></div>
```

In our `<script>` we use d3's "fluent" style:

```javascript
let svg = d3.select('#chart')
	.append('svg')
	.attr('width', width)
	.attr('height', height)
	.append('g')
	.attr('transform', `translate(${margin.left}, ${margin.top})`);
```
