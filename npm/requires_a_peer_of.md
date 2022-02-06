# Requires a peer of... error in npm: You must install peer dependencies yourself

For each dependency, you can add them at a high level by adding them as dev dependencies.

	npm install --save-dev "THE MISSING THING"

For example:

Given this error message:

> 	npm WARN THING_1 requires a peer of rollup@>=0.66.0 <2 but none is installed. You must install peer dependencies yourself.

You would use:

	npm install --save-dev "rollup@>=0.66.0 <2"