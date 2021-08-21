# Useful bookmarklets

Some basic ones I've used at times.

## Create markdown-style link to page (make-link)

Make a link in your favorites bar that creates a piece of text like this:

	[page title](full-url)

<a href="javascript:(prompt('',('['+document.title+']('+location.href+')')))()">`[title](url)`</a> &larr; *add this link as a favorite, for example, drag it to your bookmarks bar `tip`*

Or spread out...

	javascript:
	(
		prompt('', (
			'[' +
			    document.title +
			                    ']' +
			'(' +
				location.href +
			                    ')'
			)
		);
	)()

Example result:

[useful bookmarklets . Today I Learned (secretGeek)](https://til.secretgeek.net/bookmarklets/useful_bookmarklets.html)


	[useful bookmarklets . Today I Learned (secretGeek)](https://til.secretgeek.net/bookmarklets/useful_bookmarklets.html)

## Table of Contents of a page

Create a 'table of contents' (in markdown) by looping through all headings (`h1`...`h6`).


<a href="javascript:(prompt('Press Ctrl+C to copy this Table of Contents', Array.from(document.querySelectorAll('h1, h2, h3, h4, h5, h6')).reduce((all, hEl)=>{all+=(' '.repeat(parseInt(hEl.outerHTML[2])-1))+`- ${hEl.innerText}\r\n`; return all;},'')))()">table-of-contents</a>

	javascript:(prompt('Press Ctrl+C to copy this Table of Contents', Array.from(document.querySelectorAll('h1, h2, h3, h4, h5, h6')).reduce((all, hEl)=>{all+=(' '.repeat(parseInt(hEl.outerHTML[2])-1))+`- ${hEl.innerText}\r\n`; return all;},'')))()

And here it is with more whitespace:

	javascript:
		(prompt('Press Ctrl+C to copy this Table of Contents',
			Array
				.from(
					document.querySelectorAll('h1, h2, h3, h4, h5, h6')
					)
				.reduce(
					(all, hEl) => {
						all +=
							(' '.repeat(parseInt(hEl.outerHTML[2])-1)) +
								`- ${hEl.innerText}\r\n`;
							return all;
					} ,'')
			)
		)()


## Copy selected text

Copy selected text:

<a href="javascript:(function(s){try{s=document.selection.createRange().text}catch(_){s=document.getSelection()}prompt('',s)})()">copy selected text</a> &larr; *add this link as a favorite, for example, drag it to your bookmarks bar `tip`*

	javascript:(function(s){try{s=document.selection.createRange().text}catch(_){s=document.getSelection()}prompt('',s)})()

Spread over many lines it looks like this:

	javascript:
	(
		function (s) {
			try{
				s = document.selection.createRange().text;
			}
			catch(_) {
				s=document.getSelection();
			}

			prompt('',s);
		}
	)()
