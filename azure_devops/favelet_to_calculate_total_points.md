# A Bookmarklet or Favelet to Calculate "Total Points" in Azure Devops when Working on Backlog

When looking at the backlog items and choosing what to assign into a sprint, you often want to know a subtotal for a bunch of stories.

Add this bookmarklet/favelet to your bookmarks/favorites. Then while looking at the backlog items in Azure Devops, select the rows you are interested in and click the bookmarklet.


[sum points](javascript:(alert(Array.from(document.getElementsByClassName('grid-row-selected')).reduce((all, row) => { all += Number.parseInt(row.children[6].innerText) || 0; return all; }, 0))))


Here is the bookmarket in full 


	javascript:(alert(Array.from(document.getElementsByClassName('grid-row-selected')).reduce((all, row) => { all += Number.parseInt(row.children[6].innerText) || 0; return all; }, 0)))


And here it is with extra line breaks to make it more readable.


	javascript:(alert
		(Array
			.from(document.getElementsByClassName('grid-row-selected'))
			.reduce((all, row) => 
				{ all += Number.parseInt(row.children[6].innerText) || 0; 
				  return all; }, 0)
		)
	)


Note it assumes that the points are in the 7th column (index `6`), and that selected rows have a class name of `grid-row-selected` applied.

You may need to vary those assumptions.

