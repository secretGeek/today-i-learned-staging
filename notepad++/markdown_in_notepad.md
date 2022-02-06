# Markdown in Notepad++

To improve markdown styling in notepad++ (particularly if [using a dark theme in notepad++](dark_theme_notepad++.md) like `ZenBurn`, where it goes really bad....

Use [Edditoria markdown++ syntax highlighting](https://github.com/Edditoria/markdown-plus-plus)

	# Check whether you have Node.js installed
	node -v

	# Go to UDL folder of Notepad++
	cd $env:AppData\Notepad++\userDefineLangs

	# Example: Download Zenburn UDL file
	npx markdown-plus-plus zenburn

	# Read help for details
	npx markdown-plus-plus --help

Relies on [npm](../npm/getting_started.md)

You may need to restart notepad, and close and reopen relevant files, before notepad++ will apply the correct user defined language to them.

## Real time previews

> MarkdownViewer++ is a Notepad++ plugin that lets you type a file using Markdown and see the preview in real time, in a preview panel

See [github nea markdownviewer++](https://github.com/nea/MarkdownViewerPlusPlus)

Download the 32 or 64 bit (check what you have in the men of notepad++, `? > about`) from [releases](https://github.com/nea/MarkdownViewerPlusPlus/releases) (expand "&lt; Assets")

Unzip the dll and copy it to your `plugins` folder (open it with `Plugins > Open plugins folder...`)

May need to restart notepad++.

(I'm happy to note that it uses [markdig](https://github.com/lunet-io/markdig), which I also use at [TIL](https://til.secretGeek.net) and [wiki](http://wiki.secretgeek.net). Also, it is written in C#, so could be a useful reference if I ever wish to write a notepad++ plugin. And I could always fork/contribute.)

You can set custom CSS. It seems to be internet explorer browser, so CSS support is quite old.

Consider using this one: [darkdown css](https://github.com/yrgoldteeth/darkdowncss/blob/master/darkdown.css)
...though I found I had to make minor changes.

Here's my current style-sheet:

	/* Avoid page breaks inside the most common attributes, especially for exports (i.e. PDF) */
	td, h1, h2, h3, h4, h5, p, ul, ol, li {
			page-break-inside: avoid;
	}
	body{
			margin: 0 auto;
			background-color: #333;
			font-family: Georgia, Palatino, serif;
			color: #EEE;
			line-height: 1;
			max-width: 960px;
			padding: 30px;
	}
	h1, h2, h3, h4 {
			font-weight: 400;
	}
	h1, h2, h3, h4, h5, p {
			margin-bottom: 24px;
			padding: 0;
	}
	h1 {
			font-size: 48px;
	}
	h2 {
			font-size: 36px;
			margin: 24px 0 6px;
	}
	h3 {
			font-size: 24px;
	}
	h4 {
			font-size: 21px;
	}
	h5 {
			font-size: 18px;
	}
	a {
			color: #61BFC1;
			margin: 0;
			padding: 0;
			text-decoration: none;
			vertical-align: baseline;
	}
	a:hover {
			text-decoration: underline;
	}
	a:visited {
			color: #466B6C;
	}
	ul, ol {
			padding: 0;
			margin: 0;
	}
	li {
			line-height: 24px;
	}
	ul li {
			margin-left:24px;
			padding-left:8px;
	}
	p, ul, ol {
			font-size: 16px;
			line-height: 24px;
			max-width: 540px;
	}
	pre,code {
			padding: 8px 24px;
			max-width: 800px;
			white-space: pre-wrap;
			background-color:#444;
	}
	code {
			padding: 2px;
			font-family: Consolas, Monaco, Andale Mono, monospace;
			line-height: 1.5;
			font-size: 16px;
	}
	aside {
			display: block;
			float: right;
			width: 390px;
	}
	blockquote {
			border-left:.3em solid #ccc;
			padding: 0 2em;
			margin-left:0;
			max-width: 476px;
			background-color: #444;
	}
	blockquote {
		color: #AAA;
	}
	blockquote cite {
			font-size:14px;
			line-height:20px;
			color:#AAA;
	}
	blockquote cite:before {
			content: '\2014 \00A0';
	}

	blockquote p {
			max-width: 460px;
	}
	hr {
			width: 540px;
			text-align: left;
			margin: 0 auto 0 0;
			color: #999;
	}

	/* Code below this line is copyright Twitter Inc. */

	button,
	input,
	select,
	textarea {
		font-size: 100%;
		margin: 0;
		vertical-align: baseline;
		*vertical-align: middle;
	}
	button, input {
		line-height: normal;
		*overflow: visible;
	}
	button::-moz-focus-inner, input::-moz-focus-inner {
		border: 0;
		padding: 0;
	}
	button,
	input[type="button"],
	input[type="reset"],
	input[type="submit"] {
		cursor: pointer;
		-webkit-appearance: button;
	}
	input[type=checkbox], input[type=radio] {
		cursor: pointer;
	}
	/* override default chrome & firefox settings */
	input:not([type="image"]), textarea {
		-webkit-box-sizing: content-box;
		-moz-box-sizing: content-box;
		box-sizing: content-box;
	}

	input[type="search"] {
		-webkit-appearance: textfield;
		-webkit-box-sizing: content-box;
		-moz-box-sizing: content-box;
		box-sizing: content-box;
	}
	input[type="search"]::-webkit-search-decoration {
		-webkit-appearance: none;
	}
	label,
	input,
	select,
	textarea {
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
		font-size: 13px;
		font-weight: normal;
		line-height: normal;
		margin-bottom: 18px;
	}
	input[type=checkbox], input[type=radio] {
		cursor: pointer;
		margin-bottom: 0;
	}
	input[type=text],
	input[type=password],
	textarea,
	select {
		display: inline-block;
		width: 210px;
		padding: 4px;
		font-size: 13px;
		font-weight: normal;
		line-height: 18px;
		height: 18px;
		color: #808080;
		border: 1px solid #ccc;
		-webkit-border-radius: 3px;
		-moz-border-radius: 3px;
		border-radius: 3px;
	}
	select, input[type=file] {
		height: 27px;
		line-height: 27px;
	}
	textarea {
		height: auto;
	}

	/* grey out placeholders */
	:-moz-placeholder {
		color: #bfbfbf;
	}
	::-webkit-input-placeholder {
		color: #bfbfbf;
	}

	input[type=text],
	input[type=password],
	select,
	textarea {
		-webkit-transition: border linear 0.2s, box-shadow linear 0.2s;
		-moz-transition: border linear 0.2s, box-shadow linear 0.2s;
		transition: border linear 0.2s, box-shadow linear 0.2s;
		-webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
		-moz-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
		box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
	}
	input[type=text]:focus, input[type=password]:focus, textarea:focus {
		outline: none;
		border-color: rgba(82, 168, 236, 0.8);
		-webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px rgba(82, 168, 236, 0.6);
		-moz-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px rgba(82, 168, 236, 0.6);
		box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px rgba(82, 168, 236, 0.6);
	}

	/* buttons */
	button {
		display: inline-block;
		padding: 4px 14px;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
		font-size: 13px;
		line-height: 18px;
		-webkit-border-radius: 4px;
		-moz-border-radius: 4px;
		border-radius: 4px;
		-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
		-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
		box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
		background-color: #0064cd;
		background-repeat: repeat-x;
		background-image: -khtml-gradient(linear, left top, left bottom, from(#049cdb), to(#0064cd));
		background-image: -moz-linear-gradient(top, #049cdb, #0064cd);
		background-image: -ms-linear-gradient(top, #049cdb, #0064cd);
		background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #049cdb), color-stop(100%, #0064cd));
		background-image: -webkit-linear-gradient(top, #049cdb, #0064cd);
		background-image: -o-linear-gradient(top, #049cdb, #0064cd);
		background-image: linear-gradient(top, #049cdb, #0064cd);
		color: #fff;
		text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
		border: 1px solid #004b9a;
		border-bottom-color: #003f81;
		-webkit-transition: 0.1s linear all;
		-moz-transition: 0.1s linear all;
		transition: 0.1s linear all;
		border-color: #0064cd #0064cd #003f81;
		border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	}
	button:hover {
		color: #fff;
		background-position: 0 -15px;
		text-decoration: none;
	}
	button:active {
		-webkit-box-shadow: inset 0 3px 7px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
		-moz-box-shadow: inset 0 3px 7px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
		box-shadow: inset 0 3px 7px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
	}
	button::-moz-focus-inner {
		padding: 0;
		border: 0;
	}

The style info you set gets embedded into a `.ini` file here:

	$env:AppDat\Notepad++\plugins\config\MarkdownViewerPlusPlus.ini

## See also

- [dark theme notepad++](dark_theme_notepad++.md)
- [How to use Markdown in Notepad++](https://superuser.com/questions/586177/how-to-use-markdown-in-notepad)