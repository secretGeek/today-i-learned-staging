# Wait for something in Cypress, without using hardcoded milliseconds

Here is what you do NOT want to have to do....

	// hard coded wait to make sure the thing we just did has finished...
	cy.wait(5000);

(You end up having to put in loooong wait times, so the tests don't fail intermittently... slowing down the whole thing...)

Instead you can "wait until a specific element exists" (and use that as a proxy for 'it's loaded!')

	cy.get(element).should('exist/not.exist/be.visible')

e.g.

	cy.get('#loading').should('not.exist')

I believe that this will wait up to 10 seconds before cypress fails and says it timed out. More specifically, it will wait howeverlong the `cypress.json` says, e.g.


(snippet from a custom `cypress.json` file....

	"defaultCommandTimeout": 10000,  <--- this one applies in this case i reckon...
	"requestTimeout": 15000,
	"responseTimeout": 30000,
	"pageLoadTimeout": 60000,

...)

A different thing that might work for your circumstnances:

wait for a specific `xmlHttpRequest` on a path to complete, like this...

	cy.intercept(route).as('alias')
	cy.wait('@alias')

e.g.

set this up near the top of your test...

	cy.intercept('/*/api/*/People/*/Crimes').as('getCrimes')

then wait on it anywhere you want in your test (as many times as you need, too, since it's not the result that is begin aliased, but the call)

	cy.wait('@getCrimes')

Note - the example above is also a handy example of using aliases with intercepts.

Wanted: a way to use

I believe we could use aliases in the first example too, something like this:

...set this up once...

	cy.get('#loading').should('not.exist').as('loadingIndicatorGone')

However, if you try to wait on an alias defined on a get of any element, you will get a warning:

	cy.wait('@loadingIndicatorGone') // this doesn't work, and you'll get a warning

## External references

- [cypress aliases](https://docs.cypress.io/guides/core-concepts/variables-and-aliases#Aliases)