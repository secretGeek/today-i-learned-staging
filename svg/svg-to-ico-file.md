# How to convert an svg to a Windows .ico icon file, with inkscape and magick (via Powershell)

This is *not* for favicons -- that's a different recipe -- see [How to use an svg as a website or web page's favicon, including supporting legacy platforms and rich application platforms.](svg-to-favicon.md)

You need to know the sizes you are targeting.

How it is as a powershell array:

	$sizes = (16, 32, 48, 64, 256)

(Some commenters argue for a `512` size as well. Why not `24` and a `128`? Ha... very long and funny story involving Ray Chen and Steve Balmer... but no time to get into that now; wild times!)

Use `inkscape` to generate pngs at each size:

Assign your file name without a file extension to a parameter:

	$file = "your_file_name_without_a_file_extension";

Then throw the sizes at it... and generate what you need...

	$sizes | % {
		write-host "creating '$file-$_.png'..." -f yellow
		inkscape -z -w $_ -h $_ "$file.svg" -e "$file-$_.png"
	}

		#magick convert "$file.png" -resize "$_x$_" "$file-$_.png"

Once you have you .png files at the correct sizes, inspect them and zoom in to see if they are as crisp as you would like them.

Did something go wrong? Look into it! Let me know if you find something specific.

I deliberately made my svgs such that they'd be quite crisp at any size that is a multiple of 16px.

If you're happy with those png's you can convert them to a .ico in various ways.

## Sources

- [Recipe for creating Windows ICO files with ImageMagick?](https://stackoverflow.com/questions/11423711/recipe-for-creating-windows-ico-files-with-imagemagick/15099824)

## See also

- [How to use an svg as a website or web page's favicon, including supporting legacy platforms and rich application platforms.](svg-to-favicon.md)
- [Edit icon online](../graphics/icon_edit_online.md)
- [How to convert an svg to a Windows .ico icon file, with inkscape and magick](svg-to-ico-file.md)
