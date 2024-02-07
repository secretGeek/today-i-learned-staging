# TODO Items for til.secretGeek.net

> An index of improvements that could be made to this website.

## Inbox

- Generate an 'index.html' under each topic folder that redirects to "/01_summary.html"
- Generate a 'what links here' section for each page.
- 


- Improving  What Links Here

		# What links here?
		
		## What links to the topic: chocolatey?

		- chocolatey
		  - All chocolatey commands
		  - Install chocolatey (aka choco)
		  - To List the packages installed
		  - Update a chocolatey package
		npm
		  - Install npm
		  - How do I list all globally installed NPM Packages?
		powershell
		  - Replace a line in a file
		
	That's okay -- but the listed pages should list each page they link to...
	Possibly the pages of this topic could be listed on the right -- lit up by the number of things that link to them
	
- [ ] USE ChatGPT from Linqpad to index all the articles at TIL.	


### Other features that can be embedded in macros:

- [ ] `next`/`previous` buttons
	- [ ] a "next" link (and a previous) at each one...
- [ ] Ability to do "REDIRECT" for crappy pages I don't like.
- [ ] TIL Random - random article, or random within category

## Auto Linting of the TIL

- more application of `plaintext` fenced code blocks.
- Linting: 404 check all internal .md references!
- make vs-code use tab (for markdown files, not for other files)
- improve scroll bars, and write them up while you're there
- improve mobile layout
	- lighthouse etc (elements too close together [in search bar])
- keywords are highlighted (what keywords? how are keywords added? i don't have keywords)
- keywords are inter-related.
	- many are put in an ignore list?
- code block extraction and listing
- hyperlink extraction and listing

## Consider

- Squarified treemap of topics and items
- a page for showing details of embedded macros known to clowncar.
	- an improved meta language allowing these other meta features.
		- trivially pluggable meta language with other sub-languages (through the provision of named (and findable) language provider classes.)
		- i.e. zonk. This is pure zonk.

## Done

9:56 AM Friday, 22 January 2021

- [x] code block highlighting
- [x] pre blocks... correct language:
	- plaintext
	- language-powershell
	- ...idea: have a default "language" for each folder?

### 1:09 AM Sunday, 21 February 2021

- [x] Collapsible menus treemap
- [x] title of pages to be shown on page (not just the friendlified file name).
- [x] toc - expandable at top of page

### 8:37 AM Wednesday, 24 February 2021

- [x] styling of internal, external and blank, mailto, and onpage links...
- [ ] ~~a tag for including the `{toc:}` in the document.~~ (not needed now that embedded header exists)
