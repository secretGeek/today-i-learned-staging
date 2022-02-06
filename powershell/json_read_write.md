# JSON: reading and writing JSON with Powershell

	$json = Get-Content $emojiPath | Out-String | ConvertFrom-Json