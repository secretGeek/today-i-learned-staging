# How to inspect the return value of a function in Visual Studio while debugging without creating a temporary variable

I have a lot of methods that are just 1 expression, e.g.

	internal IEnumerable<Employee> CurrentEmployees()
	=> _employees.Where
		(e => !e.HasBeenFired && 
		 e.StartDate >= DateTime.Today &&
		 !e.OnExtendedLeave);

If i want to inspect the result of that function, in the debugger, it's a bit of a pain.

In the past I've sometimes refacted the method to be two lines -- with a `returnValue` variable... just so it's easier to inspect.

	internal IEnumerable<Employee> CurrentEmployees()
	{
		var returnValue =
			_employees.Where
			(e => !e.HasBeenFired && 
			e.StartDate >= DateTime.Today &&
			!e.OnExtendedLeave);
		return returnValue; // SET breakpoint here to inspect returnValue
	 }


Turns out there is `$ReturnValue` automatic variable, that the debugger creates-- in some versions of Visual Studio after 2013. Or it might be `$ReturnValue1`, or `$returnvalue`, in different versions of visual studio.

Marc Gravell covers it [here](https://stackoverflow.com/a/268052), and states:

> The value can only be seen directly after returning from the function, thus the easiest way to access it is by putting a breakpoint on the function call and step over (F10) the call.

If it's available, you will see it listed in the "autos" window. (Available from the debugging windows menu.)

## Sources

- [Can I find out the return value before returning while debugging in Visual Studio?- Stackoverflow](https://stackoverflow.com/questions/268048/can-i-find-out-the-return-value-before-returning-while-debugging-in-visual-studi)