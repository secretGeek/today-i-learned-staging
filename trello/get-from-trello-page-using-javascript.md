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


## Source

- [secretGeek.net Blogpost: Extracting a Trello board as markdown](https://secretgeek.net/trello_ws)

