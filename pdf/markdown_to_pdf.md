# Markdown to PDF

To convert markdown to PDF... I made a tool for that:

- [PDF.NimbleText.com](https://pdf.nimbletext.com)

It lets you choose different themes as well.

The conversion from html to pdf is performed by [wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf)

And it uses stylesheets/themes from:

- [https://github.com/mixu/markdown-styles](https://github.com/mixu/markdown-styles)

## Markdown to HTML

On my local machine, if I need to convert 1 or more markdown files into a static html website I use: [secretGeek/clowncar](https://github.com/secretGeek/clowncar) - a Static Site Generator i've shared on github.

## HTML to PDF

To perform the HTML to PDF step, on my local machine, I use either [Headless Chrome](../google/chrome_headless_to_convert_html_to_pdf.md) or [wkhtmltopdf](../linux/wkhtmltopdf.md).

(If doing just one file -- I open it in a browser and print to pdf, manually.)

## See also

- [Use Headless Chrome to Convert Html to Pdf](../google/chrome_headless_to_convert_html_to_pdf.md)
- [wkhtmltopdf on ubuntu headless](../linux/wkhtmltopdf.md)
