# Sortable Table (with Vanilla JS)

Back when Moses was a lad we used to use jquery plugins to make our html tables "sortable". And by sortable I mean, you click on the column heading to sort by a column.

I wanted a new "vanilla JS" solution, so I scraped together a few things from Stack Overflow and other places and here is what I've got.


First: -- we need a way to compare two cells (i.e. two `td` table cells, though they can also be `th` cells, if you've got those in your table...) and it decides which goes before which.

For this I've got a pretty simply bunch of rules.

If the `td` has an attribute "data-sortable-value" -- then it will use that value for the comparison.

If there is no such attribute, then it uses the text value of the cell, i.e. the `innerText` property.

Here's that:

	const getSortableCellValue = (tr, idx) => tr.children[idx].getAttribute("data-sortable-value") || tr.children[idx].innerText || tr.children[idx].textContent;

And to employ this, it uses a thing called a comparer which is lambda'y lambda lambdafier, like this:

	const comparer = (idx, asc) => (a, b) => ((v1, v2) =>
		v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2)
	)(getSortableCellValue(asc ? a : b, idx), getSortableCellValue(asc ? b : a, idx));



In summary:

	- Add a 'click' handler to all `th` element in the table header (unless they have `no-sort` class)
	- The click handler will:
		- Clear `data-asc` attribute on all the `th's` in the header row
			(This is done in order to remove any existing up/down arrows... as explained in the CSS section)
		- Find the body of the table
			- Sort all of the rows of the table body, by comparing the cells with the same index number as the clicked `th` elekement


And the function that sets it all up:

	function makeTableSortable(table) {
		// add a 'click' handler to all `th`s in the table header (unless they have `no-sort` class)
		table.querySelectorAll('thead tr th:not(.no-sort)').forEach(th => 
			th.addEventListener('click', (() => {
				// remove existing up down arrows from all header cells
				for (let otherTh of th.parentElement.querySelectorAll("th:not(.no-sort)")) {
					otherTh.setAttribute("data-asc", "");
				}
				// Find the tbody - in which we will sort the rows
				const currentTableBody = th.closest('table.sortable').querySelectorAll('tbody')[0];
				// Sort using the comparer, which compares the relevant cells'
				//   "data-sortable-value" attribute, if present, or inner text otherwise
				Array.from(currentTableBody.querySelectorAll('tr'))
					.sort(comparer(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
					.forEach(tr => currentTableBody.appendChild(tr));
				th.setAttribute("data-asc", this.asc);
		})));
	}


When the page first loads, call `makeTableSortable`, passing it any table you wish was sortable.

For example, you might do this when the page first loads:

    for (let table of document.querySelectorAll('table.sortable'))
        makeTableSortable(table);


## Styling the column header with up/down arrows


Here's the accompanying CSS, with explanatory comments. 

Note we're using "up arrow" `\2191` (&#x2191;) and "down arrow" `\2193` (&#x2193;) for the direction indicators.

	/* have the mouse pointer become a hand, unless the column header 'no-sort' class */
	table.sortable thead tr th:not(.no-sort) {
		cursor: pointer;
	}

	/* To be able to position our up/down arrows absolutely, we give the the a position relative. */
	th[data-asc] {
		position:relative;
	}

	/* the up/down arrows are provided by the 'after' pseudo element, located top right of the cell. */
	th[data-asc]::after {
		float: right;
		position: absolute;
		right: 0.5em;
		top:0.5em;
		font-weight: 100;
		opacity:0.8;
	}

	
	th[data-asc=true]::after {
		content: " \2193 ";
	}

	th[data-asc=false]::after {
		content: " \2191 ";
	}


And there we have it.

## Sources

- [HTML Symbols, Entities, Characters and Codes — HTML Arrows](https://www.toptal.com/designers/htmlarrows/)

## See also

- [Copy element to clipboard](copy_element_to_clipboard.md)

