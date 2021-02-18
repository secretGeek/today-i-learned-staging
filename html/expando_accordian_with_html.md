# Making Expando/Accordian with Plain Html

Here's something that escaped me for far too long.

You can create expand/collapse regions (also known as 'twisties') with plain html using the `details` tag (and the `summary` tag)

e.g. this code:


## Simplest example

Html like this:

	<details>Once expanded, this is the details you will see.</details>

Behaves like this:

<details>Once expanded, this is the details you will see.</details>



## Example with Summary

And Html like this:


	<details>
	<summary>Expand to see the details....</summary>
	Once expanded, this is the details you will see.
	</details>

Behaves like this:

<details>
<summary>Expand to see the details....</summary>
Once expanded, this is the details you will see.
</details>


Note that the summary text is visible both before and after the details are expanded.

You can alter that behaviour with css that checks if the boolean "open" attribute is defined on the details element, for example:

This style:

	details.example3[open] > summary { 
		background-color:red;
		color:black;
		outline:none;
	}

And this html...

	<details class='example3'>
	<summary>Expand to see the details....</summary>
	Once expanded, this is the details you will see.
	</details>
	
Behaves like this:


<details class='example3'>
<summary>Expand to see the details....</summary>
Once expanded, this is the details you will see.
</details>

<style>
details.example3[open] > summary { background-color:red;color:black;outline:none;}
</style>



## Animation example....

This example uses this style:

	<style>
	details.example4[open] p {
		animation: animateDown 0.2s linear forwards;
	}

	@keyframes animateDown {
		0% {
			opacity: 0;
			transform: translatey(-15px);
		}
		100% {
			opacity: 1;
			transform: translatey(0);
		}
	}
	</style>




<style>
details.example4[open] p {
  animation: animateDown 0.2s linear forwards;
}

@keyframes animateDown {
  0% {
    opacity: 0;
    transform: translatey(-15px);
  }
  100% {
    opacity: 1;
    transform: translatey(0);
  }
}
</style>


<details class='example4'>
<summary>Watch this paragraph expand over 0.2 of a second...</summary>
<p>Once expanded, this is the details you will see. I've made this text detail a bit bigger than some of the others. I hope that it is ok. Also, it includes a paragraph tag that is used for selecting the section to which the animation is applied.</p>
</details>


## Consider "::before" and "::after" pseudo elements...

This article [A (terrible?) way to do footnotes in HTML](https://shkspr.mobi/blog/2020/12/a-terrible-way-to-do-footnotes-in-html/) includes some before/after pseudo elements... in some cases that might be a useful idea.


	details[open]::before {
		content: " [";
	}
	details[open]::after {
		content: "]";
	}

Some other selectors/pseudo elements to consider are:

	details:not([open])::before
	details:not([open])::after
	details:not([open]) summary::before
	details:not([open]) summary::after

...For styling details or summary when the detail is *not* open.


## Remove the list style with...

...and you may wish to change the list style. Remove it like this...


	summary {
		 list-style: none;
	}
	details > summary::-webkit-details-marker {
		display: none;
	}

...and replace that with something awesome.

## And add a cursor pointer to the summary

Generally a good idea... (though not useful for mobile)

	summary {
		cursor: pointer;
	}

## Caveat...


- It's not supported in IE. We're finally getting to a point where those words don't mean so much. 😅.


## History

Expand/collapse sections are *similar* to Ted Nelson's 1967 idea "Stretch-Text", which I first learned about from [Brad Neuberg's stretchtext.js](http://codinginparadise.org/ebooks/html/blog/stretchtext.html).

"Similar" is doing a lot of work in the previous paragraph. The stretch-text idea is pretty interesting and more nuanced than the common expand/collapse region.

> Stretchtext consists of ordinary continuous text which can be "stretched", or made longer and more detailed. By pointing at specific areas and pulling the throttle in the "magnify" direction, the reader may obtain a greater detail on a specific subject, or area of the text. The text stretches, becoming longer, with replacement phrases, new details and additional clauses popping into place.
>
> *Ted Nelson, Hypertext Note 8, 1967*



## Source

- [Css-tricks: Quick Reminder that Details/Summary is the Easiest Way Ever to Make an Accordion](https://css-tricks.com/quick-reminder-that-details-summary-is-the-easiest-way-ever-to-make-an-accordion/) -- found via [Chase McCoy / Notes / Css-recipes](https://chasem.co/notes/css-recipes/#accordions) -- found via [Maggie Appleton's Digital Garden Directory](https://github.com/MaggieAppleton/digital-gardeners/#digital-garden-directory)
- [Css-tricks: Using &lt;details&gt; for Menus and Dialogs is an Interesting Idea](https://css-tricks.com/using-details-for-menus-and-dialogs-is-an-interesting-idea/)
- [Mozilla docs: details](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details) &amp; [Summary](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/summary)
- [Css-Tricks: Exploring What the Details and Summary Elements Can Do](https://css-tricks.com/exploring-what-the-details-and-summary-elements-can-do/)
- [`details-summary` category at Css-Tricks](https://css-tricks.com/tag/details-summary/)
