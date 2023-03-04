# Getting started with react

(My old version of this is here: [old_getting_started](old_getting_started.md) -- but things are easier in 2020, luckily.)

You can create a new starter project called `hello-world` with:

	npx create-react-app hello-world
	cd hello-word

Then you can see the available scripts with `npm run` or `yarn run`

 - start -- run it on port something.
 - test -- run tests
 - build -- create html ready for deployment
 - eject -- (this is interesting and optional! ejects the dependencies into the local folder... see later)

We'll run it first and then make some fun little changes.

	> npm start

That launches the browser on localhost 3000...

	http://localhost:3000/

And it says right there:

	edit src/App.js and save to reload.

...which we will do in a moment.

## Get your environment set up a little better

Some environment tips before proceeding:

1. Install the [react dev tools](https://reactjs.org/blog/2019/08/15/new-react-devtools.html) into chrome (or firefox) -- those are useful
2. We'll use [vs code](../vs_code/01_summary.md) to edit the whole thing... as in `code .` (which opens the current folder as a 'workspace')
3. Make sure "prettier" is installed and is set to run on save. That's useful - formats your files nicely.

## How does this demo hang together?

Soon, as suggested, we'll edited `src/App.js` -- first we'll look at it.

It starts with some imports:

	import logo from "./logo.svg";
	import "./App.css";

And ends with an export:

	export default App;

Other than that it defines a function called `App` which returns... a JSX element!

This `jsx` is compiled via Babel.

	function App() {
		return (
			<div className="App">
					<img src={logo} className="App-logo" alt="logo" />
					<p>
						edit <code>src/App.js</code> and save to reload.
					</p>
				</header>
			</div>
		);
	}

Okay, so we'll tinker with that for fun and to learn.

But what we won't learn by doing that is... how is that `App` function "wired in" to be the heart and soul of this application?

Okay -- the answer to that is... the app's starting page is `public/index.html` which has an element:

	<div id="root"></div>

...and `index.js` is called by `npm start` -- loads the `App` component, mounts it onto that `#root` div of `public/index.html`.

## Simple things to change

- Look at `src/App.js`.
- The `App` function is a component - it returns elements.
- Note that regular html tags are written in lowercase. Note that "class" is written as "className"
- Note that when elements are written on more than one line, they are wrapped in "(" and ")".
- Change the app function so it returns some slightly different HTML. Use lowercase.
- Call another, new function, that you write. e.g.

e.g.,

	function App() {
		return (
			<div className="App">
				<header className="App-header">
					<img src={logo} className="App-logo" alt="logo" />
					<About />
				</header>
			</div>
		)
	};

Okay - we've just invoked some fictional "About" tag -- now let's implement that component:

	function About() {
		return <p>About this app. It is fun.</p>;
	}

Easy. Now try passing through a "property" to the new component. Here is how it is done...

Change the `<About />` to:

	<About year="2021" />

And change the function/component to use this property, via the 'props' parameter:

	function About(props) {
		return <p>About this app. &copy; {props.year}</p>;
	}

Now that property -- it's considered to be a string. (e.g. if you added "1" to it, it would be concatenated and return "20211") To treat it as a number, you'd need to use:

	<About year={2021} />

Ok - that's *simple* props. Next trick: simple "state".

## The `useState` hook

Let's give our component some `state`.

First, make sure this file imports `useState` module.

	import { useState } from 'react';

First a pretty useless example where we have store a value in the state, but we never change it...

	function About(props) {
		const [users] = useState(100);
		return <p>About this app. We have {users} users!</p>;
	}

Hmm -- okay, neat but useless, isn't it? Let's make it that this component can change it's state.

Instead of getting just that value out of the `useState` function, we can also grab a `setter` -- watch this.

	function About(props) {
		const [users, setUsers] = useState(2);
		if (users < 10) {
			setUsers(users + 1);
		}
		return <p>About this app. We have {users} users!</p>;
	}

Okay - that's a bit of an odd example sorry. What I'm doing is calling the setter, returned by useState. But since the state of the component has been changed, it causes the component to be re-rendered to show it's new state. I put that "if" statement in because otherwise it would be re-rendered over and over until it crashes. This way it stoped when the state value gets to `10`.

Instead -- let's make it that the state is updated when a user clicks the component.

## Making a component that can contain *any* other component (or elements)

With `props` -- we can use a special `props.children` property to return *any* arbitrary elements that have been nested inside that component.

e.g.

imagine we want to nest various different things inside our special, proprietary "cool looking rounded box"

We can implement the cool looking rounded box like this ---

	function MyCoolContainer(props) {
		return <div className="my-cool-looking-rounded-box">{props.children}</div>;
	}

...and then reuse it, with *any* content inside it....  perhaps in one place it has this....

	return <MyCoolContainer><h2>Hello!</h2><p>Welcome to new york.</p></MyCoolContainer>;

and in another...

	function FunList() {
		return (
			<MyCoolContainer>
				<ol>
					<li>THis is a fun list!</li>
					<li>And it's inside a cool container!</li>
				</ol>
				<About />
			</MyCoolContainer>
		);
	}

encapsulation
move component to separate file

## The effects of running an `eject`

	npm run eject

i got a chance to fill out a survey. I choose to fill it out and tell them i was learning about how eject works.

Then used git to see what was different before/after running eject.

it added these new files to a `config` folder:

- `env.js`
- `getHttpsConfig.js`
- `jest/cssTransform.js`
- `jest/fileTransform.js`
- `modules.js`
- `paths.js`
- `pnpTs.js`
- `webpack.config.js`
- `webpackDevServer.config.js`

And these to a `scripts` folder:

- `build.js`
- `start.js`
- `test.js`

As of today (2020-12-20) it added these dependencies to `package.json`:

	"@babel/core": "7.12.3",
	"@pmmmwh/react-refresh-webpack-plugin": "0.4.2",
	"@svgr/webpack": "5.4.0",
	"@typescript-eslint/eslint-plugin": "^4.5.0",
	"@typescript-eslint/parser": "^4.5.0",
	"babel-eslint": "^10.1.0",
	"babel-jest": "^26.6.0",
	"babel-loader": "8.1.0",
	"babel-plugin-named-asset-import": "^0.3.7",
	"babel-preset-react-app": "^10.0.0",
	"bfj": "^7.0.2",
	"camelcase": "^6.1.0",
	"case-sensitive-paths-webpack-plugin": "2.3.0",
	"css-loader": "4.3.0",
	"dotenv": "8.2.0",
	"dotenv-expand": "5.1.0",
	"eslint": "^7.11.0",
	"eslint-config-react-app": "^6.0.0",
	"eslint-plugin-flowtype": "^5.2.0",
	"eslint-plugin-import": "^2.22.1",
	"eslint-plugin-jest": "^24.1.0",
	"eslint-plugin-jsx-a11y": "^6.3.1",
	"eslint-plugin-react": "^7.21.5",
	"eslint-plugin-react-hooks": "^4.2.0",
	"eslint-plugin-testing-library": "^3.9.2",
	"eslint-webpack-plugin": "^2.1.0",
	"file-loader": "6.1.1",
	"fs-extra": "^9.0.1",
	"html-webpack-plugin": "4.5.0",
	"identity-obj-proxy": "3.0.0",
	"jest": "26.6.0",
	"jest-circus": "26.6.0",
	"jest-resolve": "26.6.0",
	"jest-watch-typeahead": "0.6.1",
	"mini-css-extract-plugin": "0.11.3",
	"optimize-css-assets-webpack-plugin": "5.0.4",
	"pnp-webpack-plugin": "1.6.4",
	"postcss-flexbugs-fixes": "4.2.1",
	"postcss-loader": "3.0.0",
	"postcss-normalize": "8.0.1",
	"postcss-preset-env": "6.7.0",
	"postcss-safe-parser": "5.0.2",
	"prompts": "2.4.0",
	"react-app-polyfill": "^2.0.0",
	"react-dev-utils": "^11.0.1",
	"react-refresh": "^0.8.3",
	"resolve": "1.18.1",
	"resolve-url-loader": "^3.1.2",
	"sass-loader": "8.0.2",
	"semver": "7.3.2",
	"style-loader": "1.3.0",
	"terser-webpack-plugin": "4.2.3",
	"ts-pnp": "1.2.0",
	"url-loader": "4.1.1",
	"web-vitals": "^0.2.4",
	"webpack": "4.44.2",
	"webpack-dev-server": "3.11.0",
	"webpack-manifest-plugin": "2.2.0",
	"workbox-webpack-plugin": "5.1.4"

The `eject` script is gone from the `scripts` section and these are changed (in `package.json`):

	"start": "node scripts/start.js",
	"build": "node scripts/build.js",
	"test": "node scripts/test.js"

Jest - we can now explicitly see that the testing framework is configured like so (in `package.json`):

	"jest": {
		"roots": [
			"<rootDir>/src"
		"collectCoverageFrom": [
			"src/**/*.{js,jsx,ts,tsx}",
			"!src/**/*.d.ts"
		],

		"setupFiles": [
			"react-app-polyfill/jsdom"
		],
		"setupFilesAfterEnv": [
			"<rootDir>/src/setupTests.js"
		],

		"testMatch": [
			"<rootDir>/src/**/__tests__/**/*.{js,jsx,ts,tsx}",
			"<rootDir>/src/**/*.{spec,test}.{js,jsx,ts,tsx}"
		],
		"testEnvironment": "jsdom",
		"testRunner": "C:\\Users\\user1\\Dropbox\\secretGeek\\learning\\react\\eject-me\\node_modules\\jest-circus\\runner.js",

		"transform": {
			"^.+\\.(js|jsx|mjs|cjs|ts|tsx)$": "<rootDir>/node_modules/babel-jest",
			"^.+\\.css$": "<rootDir>/config/jest/cssTransform.js",
			"^(?!.*\\.(js|jsx|mjs|cjs|ts|tsx|css|json)$)": "<rootDir>/config/jest/fileTransform.js"
		},
		"transformIgnorePatterns": [
			"[/\\\\]node_modules[/\\\\].+\\.(js|jsx|mjs|cjs|ts|tsx)$",
			"^.+\\.module\\.(css|sass|scss)$"
		],

		"modulePaths": [],
		"moduleNameMapper": {
			"^react-native$": "react-native-web",
			"^.+\\.module\\.(css|sass|scss)$": "identity-obj-proxy"
		},
		"moduleFileExtensions": [
			"[/\\\\]node_modules[/\\\\].+\\.(js|jsx|mjs|cjs|ts|tsx)$",
			"^.+\\.module\\.(css|sass|scss)$"
		],
		"modulePaths": [],
		"moduleNameMapper": {
			"^react-native$": "react-native-web",
			"^.+\\.module\\.(css|sass|scss)$": "identity-obj-proxy"
		},
		"moduleFileExtensions": [
			"web.js",
			"js",
			"web.ts",
			"ts",
			"web.tsx",
			"tsx",
			"json",
			"web.jsx",
			"jsx",
			"node"
		],
		"watchPlugins": [
			"jest-watch-typeahead/filename",
			"jest-watch-typeahead/testname"
		],
			"resetMocks": true
	},

All of the above ^^ is Jest....

Finally: babel configured like this.

	"babel": {
		"presets": [
			"react-app"
		]
	}

## Deploying to production

If you are using the [react dev tools](https://reactjs.org/blog/2019/08/15/new-react-devtools.html) in chrome you will see an indicator that your site is in development mode.

Clicking that info takes you to [this page about what to do to get it into production](https://reactjs.org/docs/optimizing-performance.html#use-the-production-build)

>	npm run build

> This will create a production build of your app in the build/ folder of your project.

## Playground

This online playground gives you a lightweight place to try out small parts of how react works.

- [jscomplete playground](https://jscomplete.com/playground)

Here's a beginner program....

	function CowButton() {
		const [counter, setCounter] = useState(0);
		return <button onClick={() => setCounter(counter+1)}>
				🐄 "Click Me!" (clicks so far:{counter})
			</button>
	}

	ReactDOM.render(
		<CowButton />,
		document.getElementById('mountNode'),
	);

The `onClick` function can be factored into a handler on the CowButton instead...

	function CowButton() {
		const [counter, setCounter] = useState(0);
		const handleClick = () => setCounter(counter+1);
		return <button onClick={handleClick}>
				🐄 "Click Me!" (clicks so far:{counter})
			</button>
	}

	ReactDOM.render(
		<CowButton />,
		document.getElementById('mountNode'),
	);

Ok, nicer, but that `CowButton` really has too many responsibilities.

Let's have two components, one for the clicking and one for saying how many clicks.

	function CowButton(props) {
	 return <button onClick={() => props.onClickFunction(props.amount)}>
			🐄 Click me! (+{props.amount})
		</button>
	}
	function DisplayClicks(props) {
		return (<div>Moo! {props.message} clicks!</div>);
	}

	function App() {
		const [counter, setCounter] = useState(0);
		const incrementCounter = (amount) => setCounter(counter+amount);
		return (
			<div>
				<CowButton onClickFunction={incrementCounter} amount={2} />
				<DisplayClicks message={counter} />
			</div>
		);
	}

	ReactDOM.render(
		<App />,
		document.getElementById('mountNode'),
	);

## Source

- [react devtools](https://reactjs.org/blog/2019/08/15/new-react-devtools.html)

## See also

- [npx](../npm/npx.md)