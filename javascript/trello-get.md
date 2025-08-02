# Get Data from Trello Page as Markdown Using Javascript in the Developer Tools

From a 2018 comment on [this blogpost](https://secretgeek.net/trello_ws)

Still works as of 2023.

	var s = [];
	s.push("# " + jQuery(".board-header").children()[0].innerText);
	jQuery(".list:has(.list-header-name)").each(function() {
	s.push("\n## " + jQuery(this).find(".list-header-name")[0].value + "\n\n");
	jQuery(this).find(".list-card-title").each(function() {
	s.push("- " + this.innerText);
	});
	});
	copy(s.join("\n"));



# # Using browser's Dev Tools to collect elements from a page

Example -- you want to grab all of the `h2` headings from the current page.

Use the browser's dev tools (available with key Function 12,  `F12`) -- and enter this command in the console:

	let s = []; document.querySelectorAll("h2").forEach(function (el) { s.push(el.innerText);}); copy(s.join("\n"));

You may use different selectors instead for other text.

## Source

The above work is the second or third time I've written work which is a simple alternative version of this blog post from the secretGeek.net "main" blog.

- [Extracting a Trello board as markdown (secretGeek.net)](https://secretgeek.net/trello_ws) That blog post is probably the first time I wrote about the topic, but many people use this kind of technique in all sorts of ways. There needs to be more in this Genre.

## See also

- [Using browser's Dev Tools to collect elements from a page](use_dev_tools_to_collect_elements_from_page.md)
- [secretGeek.net Blogpost: Extracting a Trello board as markdown](https://secretgeek.net/trello_ws)
- [Useful bookmarklets](../bookmarkets/useful_bookmarklets.md)