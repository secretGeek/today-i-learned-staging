# Parameters: general guide

In powershell, parameters -- you know, arguments -- can be written in a lot of ways.

Even a script that declares *no* parameters can access the parameters that are handed to it.

As can a `function`, a named cmdLet, etc.

You can declare parameter names without specifying a type, e.g.

	function New-Satellite ($satelliteName, $weightInGrams) {
		write-host "The $satelliteName will weigh $weightInGrams" -f Yellow;
	}

...and a trap for young players, having just written such a `function`...

You call it WITHOUT parentheses.

You call it like this:

	New-Satellite "The Nazgul Banana" 500

and NOT like this:

	New-Satellite ("The Nazgul Banana", 500)   # NO! Not like this!

...as that would be interpreted as you sending a single parameter, an array with two values

	("The Nazgul Banana", 500).GetType()

	IsPublic IsSerial Name                                     BaseType
	-------- -------- ----                                     --------
	True     True     Object[]                                 System.Array

Hence `$SatelliteName` would be an array of objects.

Apart from remembering the "no brackets" syntax -- you also need to learn how to give types to your parameters, and so much more.

## `param()`

	Function Invoke-Clippy{
	param(
			$text="Hi! I am Clippy, your office assistant. Would you like some assistance today?"
	)

		write-host $text -foregroundColor yellow;
	}

## `[string]`

    param (
        [string]$text
    )

## `[Parameter()]`

    param (
        [Parameter(Mandatory)]
        $ApiKey
    )

## `[ValidateNotNullOrEmpty()]`

    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ApiKey
    )

todo: ValueFromPipeline


## `[CmdletBinding()]`

## `[ValueFromPipelineByPropertyName()]`



    function kvi {
    # AAA reads stream. you give it an object. it will iterate it and return an object which is the keys.
    [CmdletBinding()]
    Param(
            [Parameter(ValueFromPipelineByPropertyName)]$Keys,
            [Parameter(ValueFromPipelineByPropertyName)]$Value
    )

    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ApiKey
    )


## `[ParameterSetName]`

	[Parameter(Mandatory, ParameterSetName = 'ById')]

Another example

### `[Parameter(Mandatory, ParameterSetName = 'ById')]`


    [CmdletBinding()]
    Param(
		[Parameter(Mandatory, ParameterSetName = 'ById')]
        [ValidateNotNullOrEmpty()]
        [Alias('BaseName', 'BaseId')]
        [string]$BaseIdentity,

        [Parameter(Mandatory, ParameterSetName = 'ById')]
        [ValidateNotNullOrEmpty()]
        [string]$Table,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$Fields,

        [switch]$PassThru
    )

## `PSAvoidUsingPositionalParameters`

- PSAvoidUsingPositionalParameters

## `ValueFromRemainingArguments`

- ValueFromRemainingArguments

## `Passthrough`

- Passthrough

## Source(s)

- looking through my own code and documenting things i've learned once and forgotten since, in hope i will remember them again.
- <https://adamtheautomator.com/powershell-parameter/#Creating_a_Simple_PowerShell_Parameter>

## See also

- [How to pass an argument to a powershell script](pass_argument_to_script.md)
- [How to do default parameter values in Powershell](default_parameter_values.md)