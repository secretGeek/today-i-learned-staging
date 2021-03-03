# Historic CSS

To give something a somewhat aged and very special feel....


	historic {
		background-color: #fCfCfC;
		margin-top: 20px;
		padding: 20px;
		box-shadow: 0 0 3px #ccc inset, 0 0 70px #ccc inset, 0 0 20px #000;
		opacity: 0.9;
		border-radius: 25px;
	}

And apply a sepia tone to images...

	.historic img {
		-webkit-filter: sepia(0.3);
		filter: sepia(0.3);
	}
