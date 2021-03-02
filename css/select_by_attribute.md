# CSS: Select by content (by selecting by attribute value, with help from javascript)

I want to highlight (for example) any code element that says:

	<code>todo</code>

...but there is no CSS selector based on content. You cannot for example use:

	code[text-content='todo'] { background-color:yellow; }

So instead, I look at the situations where I want to use this technique, and decide that I only want to use it in a few very narrow cases...

1. inside code tags
2. where a specific short piece of text/content is present.

For example:

	<code>tip</code>	/* should look like a 'tip' */
	<code>note</code>	/* should look like a 'note' */
	<code>todo</code>	/* should look like a 'todo' */
	<code>draft</code>	/* should look like a 'draft' */
	<code>error</code>	/* should look like a 'error' */
	<code>bug</code>	/* should look like a 'bug' */

In css, you can select elements by the value of an attribute using (for example)

	code[data-content='overdue'] { background-color:yellow; }

Therefore, what I decided to go with is a piece of javascript that will inspect each `code` element, and if its content is quite short (less than "100" characters) it will add an attribute called `data-content` and assign it the innerText value of that `code` element.

That way, if a piece of html said:

	<code>tip</code>

it would be transformed to:

	<code data-content='tip'>tip</code>

And could be matched by a selector that reads:

	code[data-content='tip'] { ...

## The javascript to create the attributes

An example of the javascript, in vanilla js:

```javascript
for (let code of document.querySelectorAll("code")) {
	let codeText = code.innerText;
	if (codeText.length < 100) {
		// this allows us to set style rules such as `code[data-content='tip']::after { content: " 💡";}`
		code.setAttribute('data-content', codeText.toLowerCase());
	}
}
```

## Custom short-code style examples

Here are some custom short code style examples I use within this site:

	`tip` this is a tip

`tip` this is a tip

	`note` this is a note

`note` this is a note

	`todo` this is a todo

`todo` this is a todo

	`draft` is this a draft?

`draft` is this a draft?

	`error` oops! an error!

`error` oops! an error!

	`bug` well this is a bug!

`bug` well this is a bug!

	`warning` consider yourself warned

`warning` consider yourself warned

	`overdue` this was due before now

`overdue` this was due before now

	`hot` this thing is considered hot

`hot` this thing is considered hot

	`new` ah, a thing that is new

`new` ah, a thing that is new

	`scary` don't be afraid, be very afraid!

`scary` don't be afraid, be very afraid!

	`verified` verification checks appear to have passed

`verified` verification checks appear to have passed

	`fun` this is going to be fun

`fun` this is going to be fun

	`hard` this will be hard apparently

`hard` this will be hard apparently

	`easy` this should be easy

`easy` this should be easy

...with more to come.

## See also

- [Copy element to clipboard](../javascript/copy_element_to_clipboard.md) &mdash; a different thing that I also do to all the `code` (and `pre`) elements on each page