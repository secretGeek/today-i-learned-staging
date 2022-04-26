# Use Headless Chrome to Make PDFs

My previous technique was wkhtmltopdf -- works on both linux and windows, uses qt's web kit. But it wasn't rendering some obscure CSS indenting I needed. I looked up how to automate Chrome - and found it had a headless mode. We can use this to generate PDFs.

C:\Users\leonb\Dropbox\secretGeek\scratch\njb\ppmp\treatment_notes\EpisodeHtml

Firstly, you need to know where Chrome is, so you can run it. We set a variable such as:

	$cromyCromy = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe";

Now choose the url you wish to PDF-ify.

	$file_name = "index";
	$url = "file://Temp/$($file_name).html"; # could be any url.

You decide on the target PDF file name:

	$pdf_name = "$($file_name).pdf"

And you construst the "arguments" you need. (This bit can just stay the same)

	$argyArgy = "--headless --disable-gpu --run-all-compositor-stages-before-draw --print-to-pdf-no-header --print-to-pdf=""$pdf_name"" --no-margins ""$url""";

Finally you run the command itself:

	Start-Process -FilePath $cromyCromy -ArgumentList $argyArgy -Passthru -wait;

You see nothing. It may take a second or so. Your pdf file appears.


Here it is in one go:


	$file_name = "index";
	$cromyCromy = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe";
	$url = "file://Temp/$($file_name).html"; # could be any url.
	$pdf_name = "$($file_name).pdf"
	$argyArgy = "--headless --disable-gpu --run-all-compositor-stages-before-draw --print-to-pdf-no-header --print-to-pdf=""$pdf_name"" --no-margins ""$url""";
	Start-Process -FilePath $cromyCromy -ArgumentList $argyArgy -Passthru -wait;

Also, you might want to add some very basic print media CSS.


	@media print {
		@page { 
			margin: 10mm 5mm 10mm 5mm;
			size:8.25in 11.34in;
		}
	}

And this competes a bit with the above for margins, but if you only need the most minimum style, you can have something like this:


	body {
		overflow-wrap: break-word;
		font-size: 1.1em;
		max-width: 90ch;
		padding: 2ch;
		margin: auto;
		color: #222;
	}

...which is nearly 100% inspired by <https://jrl.ninja/etc/1/>

