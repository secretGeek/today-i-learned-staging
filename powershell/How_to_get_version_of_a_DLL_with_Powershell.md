# How to get the version attributes of a DLL using Powershell


The `VersionInfo` property is the one to look at -- it's child properties

It may for example have all these sub properties (or others)

	VersionInfo         :
		File:             C:\Users\user1\app\AngleSharp.dll
		InternalName:     AngleSharp.dll
		OriginalFilename: AngleSharp.dll
		FileVersion:      0.9.9
		FileDescription:  AngleSharp
		Product:          AngleSharp.Core
		ProductVersion:   0.9.9
		Debug:            False
		Patched:          False
		PreRelease:       False
		PrivateBuild:     False
		SpecialBuild:     False
		Language:         Language Neutral



	dir *.dll | % { $_.Name + " " + $_.VersionInfo.FileVersion + " " + $_.VersionInfo.ProductVersion }


Or - expressing those nested properties as custom properties.

	dir *.dll | select  -property Name, @{Ex={($_.VersionInfo.FileVersion)};Label="FileVersion"}, @{E={$_.VersionInfo.ProductVersion }; Label="ProductVersion"}


## See also

- [Create dynamic custom objects](custom_objects.md)
- [To Sort Unique](sort.md) -- shows sorting by a custom property
