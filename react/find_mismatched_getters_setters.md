# find mismatched getters and setters (for useState)

Here's a common pattern...

	const [isPotato, setIsPotato] = useState<boolean>(false);

But someone might have created an inconsistent pair, for example:

	const [isPotato, setIsItAPotato] = useState<boolean>(false);

...or a *completely* wrong pair...

	const [isPotato, setIsTomato] = useState<boolean>(false);

I've been checking for this one using powershell...

	find-text "\[([^,]+), set([^\]]+)\]" $true ("") $false $true | ? { $_.Matches[0].Groups[1].Value -ne $_.Matches[0].Groups[2].Value } | % { Write-host ("" + $_.RelativeName + "(" + $_.LineNumber + ") : " + $_.Line); write-host ($_.Matches[0].Groups[1].Value + " Not Equal " +  $_.Matches[0].Groups[2].Value ) -f red; } # find mismatched  [prop, setProp]

... (relies on my `find-text` scriptlet)

And here is a case-sensitive version that also further picks up pure capitalization errors....

	const [isPotato, setIsPoTato] = useState<boolean>(false);

	find-text "\[([^,]+), set([^\]]+)\]" $true ("") $false $true | ? { $_.Matches[0].Groups[1].Value.Substring(1) -cne $_.Matches[0].Groups[2].Value.Substring(1) } | % { Write-host ("" + $_.RelativeName + "(" + $_.LineNumber + ") : " + $_.Line); write-host ($_.Matches[0].Groups[1].Value + " Not Equal " +  $_.Matches[0].Groups[2].Value ) -f red; } # find mismatched  [prop, setProp]

None of them would pick this up though...

	const [isPotato, setisPotato] = useState<boolean>(false);

...that's a challenge for you at home.