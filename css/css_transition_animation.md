# CSS - Basic Transition Animation of a Property with CSS

Example -- when you hover over a element, have the opacity change to 100%, over a nice curve:

	.face {
		opacity: 0.5;
		transition: opacity 2s;
	}
	.face:hover {
		opacity: 1.0;
	}


Example -- when you hover over a element, have the opacity change to 100%, but following a nice curve:

	.face {
		opacity: 0.5;
		transition: opacity 2s;
	}
	.face:hover {
		opacity: 1.0 ease-in-out;
	}


transition-timing-function: ease-in;


		.face {
		  max-width: 25em;
		  max-height: 25em;
		  transiition-duration: .1s;
		  transition-delay: 0s;
		}
		.stretch img:hover {
		  max-width: 80%;
		  max-height: 80%;
		  transition-duration: .2s;
		  transition-delay: .3s;
		  transition-timing-function: ease-in;
		}
