# How to draw a circle with svg

	<svg>
		<circle cx="70" cy="70" r="70" fill="#383838" stroke="none"/>
	</svg>

And looks like this:

<svg>
    <circle cx="70" cy="70" r="70" fill="#383838" stroke="none"/>
</svg>

That's one circle, how about two?

<svg>
	<circle cx="70" cy="70" r="62" fill="#383838" stroke="white" stroke-width="5"/>
	<circle cx="120" cy="70" r="62" fill="none" stroke="white" stroke-width="5"/>
</svg>

<br />

<svg style="background:white;height:149" width="400" height="400">
    <defs>
    <g id="shape" fill="none" stroke="red">
<circle cx="100" cy="100" r="100" fill="#888" stroke="#000" stroke-width="15"/>
<circle cx="180" cy="100" r="100" fill="none" stroke="#000" stroke-width="15"/>
</g>
<filter id="shadow">
</filter>
</defs>
<g transform="scale(0.32)">
  <use xlink:href="#shape" x="50" y="50"  />
</g>
<g filter="url(#shadow)">
<rect width="100%" height="100%" fill="red" clip-path="url(#shape)"/>
</g>
</svg>

<br />

	<div style='padding:30px;background-color:#111;'>
		<svg width="406" height="406" xmlns="http://www.w3.org/2000/svg" style='background-color:#111'>
			<g transform="scale(1 1)">
				<circle cx="203" cy="203" r="203" fill="#383838" stroke="none"/>
			</g>
		</svg>
	</div>

	<div style='padding:30px;background-color:#111;'>
		<svg width="406" height="406" xmlns="http://www.w3.org/2000/svg" style='background-color:#111'>
			<g transform="scale(1 1)">
				<circle cx="203" cy="203" r="203" fill="#383838" stroke="none"/>
			</g>
		</svg>
	</div>

<!-- markdownlint-disable-file MD033 -->
