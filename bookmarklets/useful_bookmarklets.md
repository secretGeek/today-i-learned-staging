# useful bookmarklets


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




## Create markdown-style link to page (make-link)

[make](link)

	javascript:(prompt('',('['+document.title+']('+location.href+')')))()

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


