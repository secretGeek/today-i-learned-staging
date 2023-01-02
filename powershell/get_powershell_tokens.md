# Get Powershell Tokens (i.e. for parsing/syntax highlighting)

	# or:  $code = (Get-Content $PS1_FileName);
	$code = "[System.Management.Automation.PSParser]::Tokenize((Get-Content "".\.ok""), [ref]`$null) | ft"
	[System.Management.Automation.PSParser]::Tokenize($code, [ref]$null) | ft

	"dir *.*" | % {[System.Management.Automation.PSParser]::Tokenize($_, [ref]$null)} | ft

	"dir *.* | % FullName | ? {$_.ToUpperString()}"  | % {[System.Management.Automation.PSParser]::Tokenize($_, [ref]$null)} | ft

	"dir *.* | % FullName | % { $_.ToUpper()} | ?{$_ -like ""*UPDA*""} # Comment" | % {[System.Management.Automation.PSParser]::Tokenize($_, [ref]$null)} | ft

There are lots of Parser Token Types.

(Thanks to Doug Finke for guiding me to find this)

(I've written a quite poor syntax highlighter for powershell code, based on this. For years I've been putting off writing a better one. I found the right function calls etc, just haven't implemented)

## Source

