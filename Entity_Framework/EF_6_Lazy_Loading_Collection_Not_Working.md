# EF 6: Is Lazy Loading of a Collection not working for you?


We had a situation where a particular child property - an `ICollection` was not being lazy-loaded as expected.

(It took us a long time to realize that *that* is what we had... but: that *is* what we had.)

We had an `ICollection` that should've been a `navigation property` but we'd left off the *virtual* modifier.

Lazy-loading behavior would not be applied.

