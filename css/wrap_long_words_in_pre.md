# Wrapping long words in pre tags

Google console is complaining that:

	Mobile Usability > Content wider than screen

The problem appears to be `pre` tags where I mention long paths, that are basically one long word and don't get wrapped.

As usual Chris Coyier has my back. Here's what I've used for `pre` tags:

	pre {
		overflow-wrap: break-word;
		word-wrap: break-word;

		-ms-word-break: break-all;
		word-break: break-all;
		word-break: break-word;

		-ms-hyphens: auto;
		-moz-hyphens: auto;
		-webkit-hyphens: auto;
		hyphens: auto;
	}

Read his article for descriptions.

(I feel I could probably drop some of the vendor prefixed ones.)

## Source

- [Handling Long Words and URLs (Forcing Breaks, Hyphenation, Ellipsis, etc)](https://css-tricks.com/snippets/css/prevent-long-urls-from-breaking-out-of-container/)