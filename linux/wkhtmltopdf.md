﻿# wkhtmltopdf on ubuntu headless

Install `wkhtmltopdf` with

	sudo apt-get update
    sudo apt-get install wkhtmltopdf

Then try to run it, as per the example at <http://wkhtmltopdf.org>

    wkhtmltopdf http://google.com google.pdf

Receive this error:

    QXcbConnection: Could not connect to display
    Aborted (core dumped)

Or -- as happened on a different day on a different machine, with a problem that had the exact same solution -- I got this error:

	$ wkhtmltopdf http://google.com google.pdf

	wkhtmltopdf: cannot connect to X server

The problem in both cases is that there's no desktop environment, no display, no X server.

The solution, according to <http://unix.stackexchange.com/questions/192642/wkhtmltopdf-qxcbconnection-could-not-connect-to-display>

> There is a more easy way to make John WH Smith solution.
>
> Just install xvfb from apt and then, you can run:

    xvfb-run wkhtmltopdf

i.e., just put `xvfb-run` inline, before any wkhtmltopdf command.

Okay so I ran:

    sudo apt-get update
    sudo apt-get install xvfb

Then the command worked:

    $ xvfb-run wkhtmltopdf http://google.com google.pdf
    Loading page (1/2)
	Printing pages (2/2)
	Done

## wkhtmltopdf on windows

With wkhtmltopdf on windows, I had a blocking issue, where the process would hang.

I haven't been back to see if this solves it -- but from a different project, I think that this is the solution:

	process.Start();
	// process can fill standard output and hang, without this:
	string output = process.StandardOutput.ReadToEnd();
	// Wait up to 5 minutes
	process.WaitForExit(5 * 60 * 1000);

## See also

- [Use Headless Chrome to Convert Html to Pdf](../google/chrome_headless_to_convert_html_to_pdf.md)
