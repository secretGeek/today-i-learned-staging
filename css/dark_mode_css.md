# How to implement dark mode with css

The way I like to implement this is by combining "custom properties" with `prefers-color-scheme: dark`.

## Custom Properties

First... how to implement custom properties, i.e. *variables* for your colors.

	<style>
	:root {
		--main:#333;     /* our 'main' text color */
		--main-bg:#FFF;  /* our 'main' background color */
	}

	body {
		color:var(--main);	/* applying our main text color */
		background-color:var(--main-bg); 	/* applying our main background color */
	}
	</style>

With the example above we've defined some custom properties, and then used them to style our page.

## Adding in `prefers-color-scheme: dark`

We can enhance this by supporting a *dark* color scheme for any users that have configured their device to use dark.

	<style>
	:root {
		--main:#333;     /* our 'main' text color */
		--main-bg:#FFF;  /* our 'main' background color */
	}

	/* this @media query will apply to those who have
	   chosen a dark scheme on their device. */
	@media (prefers-color-scheme: dark) {
		:root {
			--main:#CCC;
			--main-bg:#222;
		}
	}

	body {
		color:var(--main);	/* applying our main text color */
		background-color:var(--main-bg); 	/* applying our main background color */
	}
	</style>

## Invert colors of some images

One other trick... if you have an image that is dark text on a light background you might want to magically `invert` the colors using css.

First put a class on all such images, for example `class='invertable'`, then apply the filter to `.invertable` inside your dark scheme `@media` query:

	<style>
	:root {
	@media (prefers-color-scheme: dark) {
		img.invertable{
			filter: invert(87%);
		}
	}
	</style>

(I use this trick on the front page of [TIL.secretGeek.net](https://TIL.secretGeek.net).

There is more detail further down on how to create your own custom dark mode, see [Implementing a Custom Dark Mode for Real (not relying on the tricks above)]

But first -- a quick and dirty technique...

## Poor man's dark mode stylesheet, take 1

Also here is a poor man's dark mode trick... and it's slightly better than other versions of this idea I've seen elsewhere...

If you don't have time to implement a full dark mode, picking all the colors, you can just invert the colors.

The problem there is that the images become negatives. So you need to re-filter them, to invert the inverted. Then you also want to darken the images, so that they don't blind your user.

There is also a class I included below (`.ignore-color-scheme`) you can apply to items you *don't* want to invert. That is gold plating!

Here's the full poor man's dark mode stylesheet...

	<style>
	html { background-color:white;} /* you *need* to set a color for html background. */

	/* dark mode support */
	@media (prefers-color-scheme: dark) {
		html {
			filter: invert(100%);
		}
		img:not(.ignore-color-scheme),video:not(.ignore-color-scheme) {
			filter: brightness(50%) invert(100%);
		}
		.ignore-color-scheme {
			filter: invert(100%);
		}
	}
	</style>

I've added this to the default built-in template used by [clowncar](https://github.com/secretGeek/clowncar) (my static site generator)

## Poor man's dark mode stylesheet, take 2

Here's a different take on the same goal. This time instead of straight up "inverting" the whole thing (like a negative) - I want to only invert the "lightness".

So if something was very light before -- I now want it to be very dark. But the "tone", the hue, should be the same.

I also turn down the brightness, which to my mind makes it less saturated. But I'm no graphic designer.

Try it for yourself.

	<style>
	html { background-color: white;}

	/* dark mode support */
	@media (prefers-color-scheme: dark) {
		html {
			filter: invert(100%) hue-rotate(180deg) brightness(75%);
		}
		img:not(.ignore-color-scheme), video:not(.ignore-color-scheme), .ignore-color-scheme {
			filter: invert(100%) hue-rotate(180deg) brightness(150%) !important;
		}
	}
	</style>

## Implementing a Custom Dark Mode for Real (not relying on the tricks above)

When you want/need to implement a *true* dark theme, not just a poor man's example as shown above, it can be a lot of work.

I've hit on a way to get a pretty good result quickly, and I'll record it here. (I've also [tweeted about it](https://twitter.com/secretGeek/status/1534731046709002240?s=20&t=GWR_4LT20Hj4UmvVeNkdjg))

First, extract every color you can see into variables. e.g. if "site.css" said:

	a:hover {
	    color:red;
	}

I changed it to:

	a:hover {
	    color:var(--a-hover);
	}

And at the top, in a `:root` block I would have:

	--a-hover: red;

Now that bit of the process was *tedious*. I got into a rhythm where I optimized the key strokes... but I would like to have a little tool to help with it. An "Extract variable" macro.

Then I created a `@media` section to redefine *all* the variables as plain old black...

	@media (prefers-color-scheme: dark) {
	    :root {
	        --body-bg: black;
	        --body: black;
	        --a-hover: black;
	    }
	}

At this point, the whole site *should* be black, as black as [Hotblack Desiato's limoship](https://hitchhikers.fandom.com/wiki/Spacecraft#Hotblack_Desiato's_limoship).

So anywhere you can still see... anything!... it means you haven't yet extracted a color into a variable. At this point, you can use dev tools to track down the source of any other elements that need to be extracted into variables. You may have to `:hover` over or `:focus` on elements for colors to show up. Keep repeating the process until *everything* is black.

That was tedious... but we're not done with the tedious bits yet...

Now change all the dark mode variables to *red*! e.g.

	@media (prefers-color-scheme: dark) {
	    :root {
	        --body-bg: red;
	        --body: red;
	        --a-hover: red;
	    }
	}

**Now** the whole site should be red... but maybe one or two things will show up that you overlooked before (particularly if they are black or close to it).

Once you're finished with that you can now trust that you've captured pretty much all the colors into variables.

Comment out your `@media` section for now, to return your site to its usual appearance.

You may take this moment to perform some "rationalization" of the different colors you've extracted. If multiple different variables have the same value -- but they should just be one variable? Perhaps some variables are the same color, but expressed in different ways (`hex` versus `rgb()`, versus `hsl()` etc.) Rationalizing/consolidating is optional, but it's a good moment to see any obvious improvements you can make.

Now install the [dark reader extension](https://darkreader.org) and turn it on.

This will show you a passable example of dark mode for your site.

Using your browser's dev tools, look at the css that `darkreader` generated for all your variables.

If you had variables like this:

	:root {
	    --body-bg:#f2f2f2;
	    --body:#333;
	    /* many more color variables here... */
	}

The dark reader extension would generate a block like this:

	:root {
	    --darkreader-bg--body-bg: #1f2223;
	    --darkreader-text--body: #c8c3bc;
	    /* many more darkened color variables here... */
	}

Copy that out, and paste it into your stylesheet's `@media (prefers-color-scheme: dark)` section.

Remove the `--darkreader` prefix and everything up to the second `--`, such as `-bg` or `-text`... and what you are left with is a custom dark version of all your variables, e.g.

	@media (prefers-color-scheme: dark) {
	:root {
	        --body-bg: #1f2223;
	        --body: #c8c3bc;
	        /* many more darkened color variables here... */
	    }
	}

Boom! Done!💥

If there are any individual colors you aren't happy with, it's easy to tweak them. Overall this is much faster and gives a more satisfying result than the manual dark theme re-designs I've attempted in the past.

## Source

- [mdn:Using CSS custom properties (variables)](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)
- [mdn:prefers-color-scheme](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme)
- [dark reader extension](https://darkreader.org)

## See also

- [Test if Windows is using light/dark theme](../windows.forms/using_dark_theme.md)
- [SSMS Dark Mode in SQL Server Management Studio](../sql_server/SSMS_Dark_Mode.md)
- [Dark Theme in Notepad++](../notepad++/dark_theme_notepad++.md)
- [Css Properties of Current Page](css_properties_of_current_page.md)
