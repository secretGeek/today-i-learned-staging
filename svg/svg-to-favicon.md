# How to use an svg as a website or web page's favicon, including supporting legacy platforms and rich application platforms.

You end up with this kind of text:


    <link rel="icon" href="/favicon.svg" type="image/svg+xml">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/site.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">

The svg is used in conjunction with some sites to make all the other variants (`32x32` etc... whatever is needed in the year you're in.)


But first you have to write the svg.

Start with:

	<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
	<style>

...and then include styles that depend on light/dark mode of browser itself.


e.g. the new NimbleText favicon has this:

Some default styles that are applied in normal situations:

	.logo {
		filter: drop-shadow( 0 1px 1px rgba(180, 180, 180, 1)) drop-shadow(0 1px 1px rgba(220, 220, 220, 0.5)) drop-shadow( 0 2px 2px rgba(200, 200, 200, 0.25));
	}

And some other styles only used in dark schemes.

	@media (prefers-color-scheme: dark) {
		.logo {
			filter: drop-shadow( 0 1px 1px rgba(0, 0, 0, 1)) drop-shadow(0 1px 1px rgba(17, 17, 17, 0.5)) drop-shadow( 0 2px 2px rgba(34, 34, 34, 0.25));
		}
	}


You may also want to make sure your vectors are nicely aligned on pixel boundaries at common sizes.

## Generate extra favicon files and html (once you have your svg built)

I'm currently using:

- [https://realfavicongenerator.net/](https://realfavicongenerator.net/)

for this.




## See also

- [How to convert an svg to a Windows .ico icon file, with inkscape and magick](svg-to-ico-file.md)
- [Use an Emoji as a favicon](..\html\emoji_favicon.md)
- [How to use an svg as a website or web page's favicon, including supporting legacy platforms and rich application platforms.](..\svg\svg-to-favicon.md)
