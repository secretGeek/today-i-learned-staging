# Pester: Getting Started with using Pester to test powershell

Pester is *the* framework for testing your powershell scripts, functions and modules. It is a BDD (behavior driven design) framework. Tests are written in, and executed by, powershell.

## Install

	Find-Module pester -Repository psgallery | Install-Module


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

## Example of a test file:

	Describe "Fire-LaserWeapon" {
			It "tries the impossible" {
					$true | Should Be $false
			}
			It "tries something ease" {
					$true | Should Be $false
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

* [Getting Started with Pester](http://duffney.io/GettingStartedWithPester) &mdash; I did this guy's powershell course in pluralsight and he discussed pester a bit.