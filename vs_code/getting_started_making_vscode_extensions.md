# Getting started making vscode extensions


You can scaffold a starting extension using `yo` (yeoman generator)

	npm install -g yo generator-code

(requires node which gives you npm.)


run: `yo code` and follow the prompts....


	> yo code

			 _-----_     ?--------------------------?
			|       |    ¦   Welcome to the Visual  ¦
			|--(o)--|    ¦   Studio Code Extension  ¦
		 `---------´   ¦        generator!        ¦
			( _´U`_ )    ?--------------------------?
			/___A___\   /
			 |  ~  |
		 __'.___.'__
	 ´   `  |° ´ Y `

	? What type of extension do you want to create? New Extension (TypeScript)
	? What's the name of your extension? HelloWorld
	? What's the identifier of your extension? helloworld
	? What's the description of your extension?
	? Initialize a git repository? Yes
	? Which package manager to use? npm
		 create helloworld\.vscode\extensions.json
		 create helloworld\.vscode\launch.json
		 create helloworld\.vscode\settings.json
		 create helloworld\.vscode\tasks.json
		 create helloworld\src\test\runTest.ts
		 create helloworld\src\test\suite\extension.test.ts
		 create helloworld\src\test\suite\index.ts
		 create helloworld\.vscodeignore
		 create helloworld\.gitignore
		 create helloworld\README.md
		 create helloworld\CHANGELOG.md
		 create helloworld\vsc-extension-quickstart.md
		 create helloworld\tsconfig.json
		 create helloworld\src\extension.ts
		 create helloworld\.eslintrc.json

		 create helloworld\package.json


## Sources

- [Your first vs code extension](https://code.visualstudio.com/api/get-started/your-first-extension)
- [Extension anatomy](https://code.visualstudio.com/api/get-started/extension-anatomy)

