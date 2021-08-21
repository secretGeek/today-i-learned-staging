# How to perform two way interaction with a hosted iframe or a popup

Use `window.postMessage` to talk to the embedded guest page (or the popup) from the host page.

And `window.opener.postMessage` to talk to the host page, from the embedded guest page.

e.g.

## Sending message to popup

	var popup = window.open(/* popup details */);
	/* wait for the popup to load, then */
	popup.postMessage("The user is 'bob' and the password is 'secret'","https://secure.example.net");

## Sending message to iFrame

	document.getElementById('cross_domain_page').contentWindow.postMessage("The user is 'bob' and the password is 'terces'","https://secure.example.net")

## Receiving messages in the guest page

	window.addEventListener("message", (event) => {
	  // Do we trust the sender of this message?
	  if (event.origin !== "http://example.com:8080")
		return;

	  // event.source is window.opener
	  // event.data is "hello there!"

	  // Assuming you've verified the origin of the received message (which
	  // you must do in any case), a convenient idiom for replying to a
	  // message is to call postMessage on event.source and provide
	  // event.origin as the targetOrigin.
	  event.source.postMessage("hi there yourself!  the secret response " +
							   "is: rheeeeet!",
							   event.origin);
	}, false);

## Receiving messages in the host

We can also receive events *back* from the guest page (the popup/iframe) -- provided it has a way to call "postMessage" on this window's window object.

	window.addEventListener("message", (event) => {
	  // Do we trust the sender of this message?  (might be
	  // different from what we originally opened, for example).
	  if (event.origin !== "http://example.com")
		return;

	  // event.source is popup
	  // event.data is "hi there yourself!  the secret response is: rheeeeet!"
	}, false);

## External references

- [Example](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage#example)
- https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage
