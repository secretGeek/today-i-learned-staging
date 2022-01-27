# Parameters: general guide

In powershell, parameters -- arguments -- can be written in a lot of ways.

Even a script that declares *no* parameters can access the parameters that are handed to it.

As can a function, a named cmdLet, etc.

YOu can declare parameter names without specifying a type, e.g.

	function New-Satelitte ($sateliteName, $weightInGrams) {
		write-host "The $sateliteName will weigh $weightInGrams" -f Yellow;
	}

...and a trap for young players, having just written such a function, if you write code that call its, you must note that you pass arguments without putting parenthesese around the whole thing. That is you call it so:


	New-Satelitte "The Nazgul Banana" 500


and NOT like this:

	New-Satelitte ("The Nazgul Banana", 500)   # NO! Not like this!

...as that would be interpreted as you sending a single parameter, an array with two values


	("The Nazgul Banana", 500).GetType()

	IsPublic IsSerial Name                                     BaseType
	-------- -------- ----                                     --------
	True     True     Object[]                                 System.Array


Hence `$SatelliteName` would be an array of objects.


Apart from remembering the "no brackets" syntax -- you also need to learn how to give types to your parameters, and so much more.



todo: param()
todo: [Parameter()]
todo: Mandatory
todo: ValueFromPipeline
todo: ValueFromPipelineByPropertyName
todo: ParameterSetName
todo: PSAvoidUsingPositionalParameters
todo: ValueFromRemainingArguments / Passthrough



## Source(s)

- looking through my own code and documenting things i've learned once and forgotten since, in hope i will remember them again.
- https://adamtheautomator.com/powershell-parameter/#Creating_a_Simple_PowerShell_Parameter



## See also

- [parameters general guide](../powershell/parameters general guide)

- CmdLetBinding
- 