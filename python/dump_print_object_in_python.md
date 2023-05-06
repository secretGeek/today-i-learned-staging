# How to Dump() or Print an Object or Expression in Python

## With Pretty Print

If the object has an internal `__dict__` attribute, describing its properties, then this works ok:

(Make require `pip install pprint` from an elevated console)

    from pprint import pprint

    pprint(vars(your_object))

The `dir()` method basically loops through the `__dict__`

So this gives a similar result:

    def dump(obj):
    for attr in dir(obj):
        print("obj.%s = %r" % (attr, getattr(obj, attr)))

## Objects including objects without `__dict__`

    from pprint import pprint
    from inspect import getmembers
    from types import FunctionType

    def attributes(obj):
        disallowed_names = {
        name for name, value in getmembers(type(obj))
            if isinstance(value, FunctionType)}
        return {
        name: getattr(obj, name) for name in dir(obj)
            if name[0] != '_' and name not in disallowed_names and hasattr(obj, name)}

    def dump(obj):
        pprint(attributes(obj))

## Example


## Sources

- [Stackoverflow: Is there a built-in function to print all the current properties and values of an object?](https://stackoverflow.com/questions/192109/is-there-a-built-in-function-to-print-all-the-current-properties-and-values-of-a)