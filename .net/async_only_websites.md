# Async-Only Website

You receive an error like this:

> Synchronous operations are disallowed
>
> -- synchronous operations, have quietly been disallowed.


## The Sledge Hammer approach

```
services.Configure<IISServerOptions>(options =>
{
  options.AllowSynchronousIO = true;
});
```
Or... see what synchronous controller actions you still have. 

Can they *all* be converted to asynchronous?






