# How do I list all globally installed NPM Packages?

	npm list -g -depth 0

The above lists all the globally installed npm packages, and does not list their dependencies.

Omit the `depth 0` bit and you'll also see the full ugly rat's nest of dependencies they've wrought upon your hard ware.

## See also

- [Chocolatey List Packages installed on the machine](../chocolatey/list_localonly.md) &mdash; `choco list -lo` (ironic that `localonly` in chocolatey is the same as `global` in NPM. These are opposite meanings for the same thing! #irony.