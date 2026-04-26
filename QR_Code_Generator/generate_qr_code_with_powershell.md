# Generate a QR Code with Powershell

Install `QRCodeGenerator` module -- 

	# Install the module (click 'Y' or 'A' when prompted)
	Install-Module -Name QRCodeGenerator -Scope CurrentUser -Force

	# Import the module into your session
	Import-Module QRCodeGenerator


Now generate the code:

	New-PSOneQRCodeText -Text "https://til.secretGeek.net" -OutPath "C:\temp\QR_til.png" -Show

result:

![TIL.SecretGeek.net QR Code](QR_til.png)


## Source

- [Powershell Gallery: QR Code Generator](https://www.powershellgallery.com/packages/QRCodeGenerator/2.6.0) from Dr. Tobias Weltner. (Thanks!)


