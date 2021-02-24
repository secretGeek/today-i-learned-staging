# How to implement dark mode with css

The way I like to implement this is by combining "custom properties" with `prefers-color-scheme`.

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

## Adding in `prefers-color-scheme`

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

(I use this trick at the front page of [TIL.secretGeek.net](TIL.secretGeek.net).

Also here is a poor man's dark mode trick... and it's slightly better than other versions of this idea I've seen elsewhere...

If you don't have time to implement a full dark mode, picking all the colors, you can just invert the colors.

The problem there is that the images become negatives. So you need to re-filter them, to invert the inverted. Then you also want to darken the images, so that they don't blind your user.

There is also a class i created (`.ignore-color-scheme`) you can apply to items you *don't* want to invert. That is gold plating!

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

## Poor man's dark mode stylesheet, take 2:

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

## Source

- [mdn:Using CSS custom properties (variables)](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)
- [mdn:prefers-color-scheme](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme)