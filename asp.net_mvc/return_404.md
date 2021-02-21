# Want to return 404 from a method in asp.net MVC?

It's as easy as

	return HttpNotFound();

Can also put a message in

	return HttpNotFound("No such puppy!");


And for 403 &mdash; try this:

	return new HttpUnauthorizedResult("Forbidden biscuits.");

**But** all of those will probably end up displaying the IIS-level error page, not the custom error page if you have one.

A more general method -- that *can* end up at your custom 404 error page inside asp.ent mvc, if you have one, is:

	throw new HttpException(404, "KITTEN MISSING");

and

	throw new HttpException(403, "FORBIDDEN KITTEN!");

And more generally try this:

	throw new HttpException((int)HttpStatusCode.OK);


etc... for each `http code`


See [Custom Errors in asp.net mvc 5](custom_errors.md) -- to get this perfected!


## Breaking news

In `asp.net core` you do this:

	return NotFound();

Or even:

	return NotFound("No such kitten!");

The comment on this is funny (the comment you see in a tooltip in visual studio)

	// Summary:
	//     Creates an Microsoft.AspNetCore.Mvc.NotFoundResult that produces a Not Found
	//     (404) response.

So on the one hand we're trying to be "transport-agnostic", removing `Http` from the name... but on the other hand we still need to let the developer know that this is *really* a `404`. So we embed it in the comment. *Wink* *wink*.



## See also

- [Custom Errors in asp.net mvc 5](custom_errors.md)