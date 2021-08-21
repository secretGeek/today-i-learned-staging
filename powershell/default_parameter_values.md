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
