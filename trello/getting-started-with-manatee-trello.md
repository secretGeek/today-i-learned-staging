# Getting Started with Manatee Trello from C# and Linqpad

In linqpad, use **nuget** to search for packages related to trello. We'll be using the most popular one in 2020 and probably 2021 and 2022 as well.

**Add "manatee.trello"** to your linqpad script.

(It will have to perform a few steps and then you will have to accept all the licenses (just 1 click))

(In Visual Studio you'd use `Install-Package Manatee.Trello` or the package manager gui etc.)

There are many namespaces you *can* add.


	var board = new Board("<board ID>");

It is immediately available, but empty.

To make the data available in the board, it is fully populated by awaiting:


	await board.Refresh();


Or you can refresh just the lists, and not wait for the entire board to be refreshed.

	await board.Lists.Refresh();


This is pretty cool: you don't have to refresh all of the data. They have a little "convention" where objects have a property called "fields" and you specify in there which fields you do (or don't) want to download.




Before you go too far, you know will need an API key.




## Sources

- [Official Manattee.Trello Getting Started](https://gregsdennis.github.io/Manatee.Trello/usage/getting-started.html)

- [Atlassian Trello Developer: API Introduction : Authentication and Authorization](https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/)