# Making Expando/Accordian with Plain Html

Here's something that escaped me for far too long.

You can create expand/collapse regions with plain html using the `details` tag (and the `summary` tag)

e.g. this code:


## Text below can expand...

Html like this:

	<details>Once expanded, this is the details you will see.</details>

Behaves like this:

<details>Once expanded, this is the details you will see.</details>



## Text below can expand...

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

You can alter that behaviour with css that checks if the boolean "open" attribute is defined on the details element, for example>

This style:

	details.example3[open] > summary { 
		background-color:red;
		color:black;
		outline:none;
	}

ANd this html...

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



## Source

- [Quick Reminder that Details/Summary is the Easiest Way Ever to Make an Accordion](https://css-tricks.com/quick-reminder-that-details-summary-is-the-easiest-way-ever-to-make-an-accordion/)