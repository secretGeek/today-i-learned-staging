# See all console colors:

	[enum]::GetValues([System.ConsoleColor]) | Foreach-Object {Write-Host $_ -ForegroundColor $_}

 * Black
 * DarkBlue
 * DarkGreen
 * DarkCyan
 * DarkRed
 * DarkMagenta
 * DarkYellow
 * Gray
 * DarkGray
 * Blue
 * Green
 * Cyan
 * Red
 * Magenta
 * Yellow
 * White

Or to try every possible foreground/background combo:

	$colors = [enum]::GetValues([System.ConsoleColor])
	foreach( $fcolor in $colors )
	{
		foreach( $bcolor in $colors )
		{
			Write-Host -NoNewLine "$fcolor/$bcolor "-ForegroundColor $fcolor -BackgroundColor $bcolor
		}
	}

<!--  [enum]::GetValues([System.ConsoleColor]) | % { Write-Host " * $($_)" -f ($_) }  -->

	$host.ui.rawui.ForegroundColor = <ConsoleColor>
	$host.ui.rawui.BackgroundColor = <ConsoleColor>
	$Host.PrivateData.ErrorForegroundColor = <ConsoleColor>
	$Host.PrivateData.ErrorBackgroundColor = <ConsoleColor>
	$Host.PrivateData.WarningForegroundColor = <ConsoleColor>
	$Host.PrivateData.WarningBackgroundColor = <ConsoleColor>
	$Host.PrivateData.DebugForegroundColor = <ConsoleColor>
	$Host.PrivateData.DebugBackgroundColor = <ConsoleColor>
	$Host.PrivateData.VerboseForegroundColor = <ConsoleColor>
	$Host.PrivateData.VerboseBackgroundColor = <ConsoleColor>
	$Host.PrivateData.ProgressForegroundColor = <ConsoleColor>
	$Host.PrivateData.ProgressBackgroundColor = <ConsoleColor>

	$host.ui.rawui
	$host.ui.rawui | select *color

	Get-PSReadlineOption
	Get-PSReadlineOption | Select *color

	$Host.PrivateData

## Source

 * http://blogs.technet.com/b/gary/archive/2013/11/21/sample-all-powershell-console-colors.aspx