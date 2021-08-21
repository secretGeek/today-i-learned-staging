# Pester: Getting Started with using Pester to test powershell

Pester is *the* framework for testing your powershell scripts, functions and modules. It is a BDD (behavior driven design) framework. Tests are written in, and executed by, powershell.

## Install

	Find-Module pester -Repository psgallery | Install-Module

*Must run as an admin.* May get this warning:

> You are installing the modules from an untrusted repository. If you trust this repository, change its InstallationPolicy value by running the Set-PSRepository  cmdlet. Are you sure you want to install the modules from 'https://www.powershellgallery.com/api/v2'?

...which is resolved with.

	Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

That succeeded then retried installing pester.

I then received this error message:

	> Find-Module pester -Repository psgallery | Install-Module
	PackageManagement\Install-Package : A Microsoft-signed module named 'Pester' with version '3.4.0' that was previously installed conflicts with the new module
	'Pester' from publisher 'CN=DigiCert Assured ID Root CA, OU=www.digicert.com, O=DigiCert Inc, C=US' with version '4.10.1'. Installing the new module may
	result in system instability. If you still want to install or update, use -SkipPublisherCheck parameter.
	At C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PSModule.psm1:1912 char:34
	+ ...          $null = PackageManagement\Install-Package @PSBoundParameters
	+                      ~~~~~ ~~~~~~~~~ ~~~~ ~~~~~ ~~~~~~~~ ~~~~~~~~~~ ~~~~~
			+ CategoryInfo          : InvalidOperation: (Microsoft.Power....InstallPackage:InstallPackage) [Install-Package], Exception
			+ FullyQualifiedErrorId : PublishersMismatch,Validate-ModuleAuthenticodeSignature,Microsoft.PowerShell.PackageManagement.Cmdlets.InstallPackage

So I tried:

Find-Module pester -Repository psgallery | Install-Module -SkipPublisherCheck

## Get Help

	Invoke-Pester -?
	New-Fixture -?
	New-PesterOption -?

## Create new file

	New-Fixture -Name Fire-LaserWeapon

Will create two pre-populated files:

- `Fire-LaserWeapon.ps1`
- `Fire-LaserWeapon.Tests.ps1`

...unless the file already exists in which case it skips that one and gives you a warning. (i.e. it won't overwrite your stuff)

## Example of a test file

	Describe "Fire-LaserWeapon" {
		It "tries the impossible" {
			$true | Should Be $false
		}
		It "tries something easy" {
			$true | Should Be $true
		}
	}

## Running our tests

We can run those tests with:

	Invoke-Pester -Script ./Fire-LaserWeapon.Tests.ps1

## All Pester commands (today)

- AfterAll
- AfterEach
- Assert-MockCalled
- Assert-VerifiableMocks
- BeforeAll
- BeforeEach
- Context
- Describe
- Get-MockDynamicParameters
- Get-TestDriveItem
- In
- InModuleScope
- Invoke-Mock
- Invoke-Pester
- It
- Mock
- New-Fixture
- New-PesterOption
- SafeGetCommand
- Set-DynamicParameterVariables
- Set-TestInconclusive
- Setup
- Should

...found via:

	which * | ? { $_.Source -eq "Pester" } | % {" - $($_.Name)"} | clipp

## References

- [Getting Started with Pester](http://duffney.io/GettingStartedWithPester) &mdash; I did this guy's powershell course in pluralsight and he discussed pester a bit.
