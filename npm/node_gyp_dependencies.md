# Node-gyp is much used by npm, but its dependencies need to be manually installed

> Some npm plugins need node-gyp to be installed.<br />
> However, node-gyp has its own dependencies ([from the github page](https://github.com/TooTallNate/node-gyp))
> <br />&mdash;http://stackoverflow.com/a/21366601/49

Try this first:

	npm install -g node-gyp