# Copy element to clipboard

`tip` These methods copy **text** only. If you want to copy (non-markdown) formatted text or other content (like images), you might want to consider [ClipboardJS](https://clipboardjs.com).

Here's a general 'vanilla js' solution:

	<pre id="mypre">Hello world2!</pre>
	<button onclick="copytext(document.querySelectorAll('#mypre')[0].textContent)">hello</button>

	<script>
	function copytext(copyText) {
		const textArea = document.createElement('textarea');
		textArea.style.position = "absolute";
		// to prevent scrolling on IE/Safari, place the element beside us... (not a perfect solution)
		textArea.style.top = "" + ((document.documentElement && document.documentElement.scrollTop) ||  document.body.scrollTop) + "px";
		textArea.style.left = "-100%";
		textArea.textContent = copyText.trim();
		document.body.appendChild(textArea);
		textArea.select();
		document.execCommand("copy");
		// Consider: visually indicate success... (see example below)
		textArea.parentNode.removeChild(textArea);
	}
	</script>

(Note the `trim()`... most people forget that, i think it matters a lot. You don't want leading/trailing spaces, tabs, new lines. It's standard in enough browsers no, and happily it's not just spaces)

When you want just a single word/term that is copyable....

	<code onclick="copytext('%name%');" class="copyable" title="click to copy">%name%</code>
	<code onclick="copytext('%email%');" class="copyable" title="click to copy">%email%</code>
	<code onclick="copytext('%unsub%');" class="copyable" title="click to copy">%unsub%</code>

And this styling works for me:

	code.copyable {
		background-color:white;
		border:1px solid #CCC;
		border-radius:5px;
		padding:2px 4px;
	}
	code.copyable:hover {
		cursor: pointer;
	}

To automatically hook up *all* `pre` and `code` items to be copyable (but *not* allow `code` *inside* `pre` to trigger a second copy...)

Run this code:

	for(let preOrCode of $('pre, code')) {
		preOrCode.setAttribute('title', "Click to copy.");
		preOrCode.setAttribute('onclick', "copyItemText(this);");
	}

    // Don't accidentally wire yourself to a code inside a pre (those are common)
	for(let codeInPre of $('pre code' )) {
		codeInPre.removeAttribute('onclick');
	}

Which relies on these functions:

	function copyItemText(item) {
		item.setAttribute('title', "Copied. Click to copy again.");
		copytext(item.textContent);
	}

	function copytext(copyText) {
		const textArea = document.createElement('textarea');
		textArea.style.position = "absolute";
		// to prevent scrolling on IE/Safari, place the element beside us...
		textArea.style.top = "" + ((document.documentElement && document.documentElement.scrollTop) ||  document.body.scrollTop) + "px";
		textArea.style.left = "-100%";
		textArea.textContent = copyText.trim();
		document.body.appendChild(textArea);
		textArea.select();
		document.execCommand("copy");
		textArea.parentNode.removeChild(textArea);
	}

	function $(selector) {
		return document.querySelectorAll(selector);
	}

-----

## Fading out Tooltip at Copy Time

Here's another variation, this time with a fading out tooltip.

To support the tooltip I have these two CSS classes:

	/*
		Used for notifications that clipboard text has been copied.
		Can be used for other transient js messages.
	*/
	.floating-message {
		/* initial opacity/top margin */
		opacity: 1;
		margin-top: 0;
		padding: 5px;
		box-shadow: 0 0 3px #888;
		background-color: #FFC;
		color: #333;
		border-radius: 5px;
		font-size: 0.8em;
		transform: translate(-50%,-120%);
	}

	.fade-message-out {
		/* when 'hidden' it will fade out and float "up" over 1 second */
		opacity: 0;
		margin-top: -50px;
		/*transition: opacity 1s ease-in-out, margin 1s ease-in-out;*/
		transition: opacity 1s ease-in-out, margin 1s ease-in-out;
	}

And here's the function that shows the tool tip. It is centered above the `element` passed to it.

And the function to show a message that floats away is like this:

	// Message will be displayed near the element and disappear soon after
	function showFloatingMessage(message, element) {
		var rect = element.getBoundingClientRect();
		const tip = document.createElement('span');
		tip.innerText = message;
		tip.classList.add("floating-message");
		tip.style.position = "absolute";
		var top = rect.top + ((document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop);
		tip.style.top = top + "px";
		tip.style.left = (rect.left + ((rect.right - rect.left) / 2)) + "px";
		document.body.appendChild(tip);

		// apply 'fade-message-out' to make it fade with css animation -- and then remove it altogether.
		setTimeout(function () {
			tip.classList.add("fade-message-out");
			setTimeout(function () { tip.parentNode.removeChild(tip); }, 1000);
		}, 10);
	}

And here's the *revised* function that does the copying itself, and which then notifies the `showFloatingMessage`. It now has an extra parameter, `item`.

	function copyToClipboard(value, element) {
		const textArea = document.createElement('textarea');
		textArea.style.position = "absolute";
		// top is at current height, to avoid causing a scroll on IE/Safari.
		var lastScrollHeight = element.scrollHeight; // this is used to prevent any unwanted scrolling (particularly in IE and Safari)
		textArea.style.left = "-100%"; // off screen
		textArea.style.width = "200px";
		textArea.textContent = value.trim();
		element.parentNode.appendChild(textArea);
		textArea.select();
		document.execCommand("copy");
		textArea.parentNode.removeChild(textArea);
		showFloatingMessage("copied to clipboard.", element);
		var scrollDiff = element.scrollHeight - lastScrollHeight;
		element.scrollTop += scrollDiff; // scroll us back where we were... if there has been any change.

	}

And I call it via this helper method:

	function copyItemText(item) {
		copyToClipboard(item.textContent, item);
	}

And wire that up to every `pre`/`code` element like this:

	for(let preOrCode of $('pre, code')) {
		preOrCode.setAttribute('title', "Click to copy.");
		preOrCode.setAttribute('onclick', "copyItemText(this);");
	}

## Using this with JQuery

The methods above are all vanilla JS. If wiring it up with jQuery, note that you have to pass a `DOM` element, not a `JQuery` element.

For example:

	// Inject a button before every pre...
	$("<button class='copy-text btn btn-sm' title='copy code to clipboard'>copy</button>").insertBefore($("pre"));

	// And have it call 'copy to clipboard'
	$(".copy-text").click(function (e) {
		copyToClipboard($(this).next("pre").text(), this); // that final *this* is the DOM element.
		// stop any other consequence fo this click from occurring.
		e.preventDefault();
		return false;
	});

And to style that little button, this CSS is my starting point:

	.copy-text {
		float: right;
		background-color: #F5F5F5; /* same as pre */
		box-shadow: 0 0 3px #AAA, 0 0 3px #AAA;
		margin-top: 5px;
		margin-right: 5px;
	}