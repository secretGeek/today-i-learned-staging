# Install latest dotnet sdk version

## Install via WinGet

	winget install Microsoft.DotNet.SDK.8

## Install via Choco

	choco install dotnet-sdk --version=8.0.0

## Install via Powershell (download and run exe)

	Invoke-WebRequest -Uri https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-8.0.100-windows-x64-installer -OutFile dotnet-sdk-8.0.100-win-x64.exe
	Start-Process -FilePath "dotnet-sdk-8.0.100-win-x64.exe" -Wait

## To Find the "latest" dotnet sdk

Go to this page:

- [Microsoft Dotnet, Download Dotnet](https://dotnet.microsoft.com/en-us/download/dotnet)
- Parse the html of that page to determine the first URL which contains text about "latest", or is immediately followed by text containing the word "latest", and that is the link to follow. (Currently: `https://dotnet.microsoft.com/en-us/download/dotnet/8.0`)

-- <https://dotnet.microsoft.com/en-us/download/dotnet/8.0>

## See also

- [Find which .net versions you have](Find_Which_DotNet_Versions_You_Have.md)
