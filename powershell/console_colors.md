# See all console colors

	[enum]::GetValues([System.ConsoleColor]) | Foreach-Object {Write-Host $_ -ForegroundColor $_}

- Black
- DarkBlue
- DarkGreen
- DarkCyan
- DarkRed
- DarkMagenta
- DarkYellow
- Gray
- DarkGray
- Blue
- Green
- Cyan
- Red
- Magenta
- Yellow
- White

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


I seem to have some groovy `write-host` replacement installed called 'Pansies' that means i can express colors in hex rgb, so this produces some nice tones:

	1..9 | % { 
		$R = $_; 1..9 | % { 
			$G = $_; 1..9 | % { 
				$B = $_; 
				write-host " $($R)$($R)$($G)$($G)$($B)$($B)" -f "#$($R)$($R)$($G)$($G)$($B)$($B)" -n 
			}
		}
	}


Oh - it has some other methods that are useful too:

	which * | ? { $_.Source -eq "Pansies" }

	CommandType     Name                                               Version    Source
	-----------     ----                                               -------    ------
	Alias           Text -> New-Text                                   2.0.0      Pansies
	Cmdlet          Get-ColorWheel                                     2.0.0      Pansies
	Cmdlet          Get-Complement                                     2.0.0      Pansies
	Cmdlet          Get-Gradient                                       2.0.0      Pansies
	Cmdlet          New-Text                                           2.0.0      Pansies
	Cmdlet          Write-Host                                         2.0.0      Pansies

e.g.


	> get-complement "red"

	Mode           RGB (hex) X11ColorName         Ordinals                  XTerm Index ConsoleColor
	----           --------- ------------         --------                  ----------- ------------
	Automatic      #00FFFF   Cyan                 R=0.000; G=255; B=255     14          Cyan


## Source

- [technet: sample all powershell console colors](http://blogs.technet.com/b/gary/archive/2013/11/21/sample-all-powershell-console-colors.aspx)
