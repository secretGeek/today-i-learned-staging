# Load script immediately but don't execute until page is parsed

TL/DR; Add your script tags to the top of the page, with a defer attribute, e.g.

	<script type="text/javascript" src="/script.js" defer></script>

This way it will begin loading immediately, but will not be executed until the entire page has been rendered.

The old way was to add scripts to the bottom of the page, so they wouldn't be executed until the entire page has been rendered. The downside was that they wouldn't start downloading until that part of the page was parsed.

The old-old way was to add scripts to the top of the page but have cumbersome checks in your code such that they wouldn't be executed until the a page loaded event was fired.

The old-old-old way was to add scripts to the top of the page but have you code trigged by a onload="go();" attribute on the body tag.

Before that, the old-old-old-old way was just to bang a pair of rocks together until you got sparks.
