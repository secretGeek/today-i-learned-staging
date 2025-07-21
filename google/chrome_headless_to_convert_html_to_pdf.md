# Use Headless Chrome to Convert Html to Pdf

TL/DR

## Simple example


	chrome.exe --headless --print-to-pdf-no-header --print-to-pdf="C:\Output\MyPdf.pdf" "file:///C:/temp/MyHtml.html"

## Example with more parameters

This example has more (and quite useful) parameters

	chrome.exe --headless --disable-gpu --run-all-compositor-stages-before-draw --print-to-pdf-no-header --print-to-pdf="C:\Output\MyPdf.pdf" --no-margins "file:///C:/temp/MyHtml.html"

## More realistic (battle tested) example

Here's an *actual* script I used for converting hundreds of html files into pdf.


	$fileNum = 0;
	$numFiles = (dir *.html | measure | % Count);
	#$cromyCromy = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe";
	$cromyCromy = "C:\Program Files\Google\Chrome\Application\Chrome.exe";
	dir . *.html | #select -first 100 |
	% {
		$fileNum += 1;
		$ff = $_.Name;
		$full_ff = "file:///" + ($_.FullName -replace '\\', '/');
		$pdf_name = ($_.FullName -replace ".html", ".pdf");
		$commandTime = (measure-command {
			$argyArgy = "--headless --disable-gpu --run-all-compositor-stages-before-draw --print-to-pdf-no-header --print-to-pdf=""$pdf_name"" --no-margins ""$full_ff""";
			$x = (Start-Process -FilePath $cromyCromy -ArgumentList $argyArgy -Passthru -wait);
			write-host "$($x.Id)`t`t" -f red -n;
			sleep 1;
		});
		Write-host "$fileNum / $numFiles`t" -f darkgray -n;
		Write-Host "`t$($commandTime.TotalMilliseconds)ms " -n;
		Write-Host "`t$ff" -f white;
		
	}

This worked nicely.

## See also

- [wkhtmltopdf on ubuntu headless](../linux/wkhtmltopdf.md)
