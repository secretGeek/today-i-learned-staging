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

We can move the parameters out of a `(){}` and into a  `{param()}` 

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



# QUESTION: DOES VALUE FROM PIPELINE REQUIRE A CMDLEt bindinG???




	Param(
        [parameter(ValueFromPipeline=$True)]
        [string[]]$Computername
    )
	



## `[CmdletBinding()]`

Okay, so here's what it is about `CmdLetBinding`


- You get access too all the `Common Parameters` -- these are things that come in handy all the time.

## Common Parameters are: 

- `Verbose`,
- `Debug`,
- `ErrorAction`,
- `ErrorVariable`,
- `OutVariable`,
- `OutBuffer`,
- `PipelineVariable`, and
- `WarningAction`.


These handy parameters, provide arguably consistent behavior and debugging capabilities across all your scripts.



## Parameter Validation and Type Checking




When you use CmdletBinding you choose to opt in to robust parameter validation and `type checking`.

These confirm that input to your function has the correct form, and prevents many, if not all, common scripting errors.


With cmdLetBinding you get -- and this is a big deal right here -- *Pipeline Support*!


Your *`Advanced functions`* can seamlessly integrate with the PowerShell pipeline, allowing them to process objects passed from previous commands and enabling more flexible and modular scripting.

You get access to other advanced features too, including:

SupportsShouldProcess: Enables 


Confirm and  WhatIf parameters -- there are available if the SupportsShouldProcess feature is enabled. These  work together providing another safety layer, preventing some potentially destructive operations.


You can now use Parameter Sets

Parameter sets allow you to define different sets of parameters for different scenarios. This offers more flexibility in how your function can be called, giving optional competing distinct sets of parameters names and types, in a priority order.
$PSCmdlet Automatic Variable: Provides access to the $PSCmdlet automatic variable, which offers methods and properties for interacting with the PowerShell runtime environment (e.g., WriteVerbose, WriteWarning).
ConfirmImpact: Allows setting a confirmation impact level for the function, influencing when the Confirm prompt appears.
Improved Error Handling: CmdletBinding enhances error handling by automatically generating errors for unknown parameters and unhandled positional arguments, making your scripts more robust.




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