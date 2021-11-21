# How to do default parameter values in Powershell

You have to give a formal declaration of the function's parameter.

	function Test {
		Param (
			[ValidateNotNullOrEmpty()]
			[String]
			$String = 'DEFAULT'
		)

		Write-Host -Object "String: $String"
	}


## See also

- [How to pass an argument to a powershell script](pass_argument_to_script.md)
