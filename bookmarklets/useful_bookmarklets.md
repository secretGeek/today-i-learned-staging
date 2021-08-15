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

`todo` definitely need this one. Loops through h[1-5] and make toc.

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
