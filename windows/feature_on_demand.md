﻿# Feature on demand

In Windows 10, many optional Features are available as "Features on Demand" -- under the Apps & Features area.

e.g.

	Start Menu |
		Apps & Features |
			Manage Optional Features |
				Add a feature |
					"RSAT: Active Directory Domain Services and Lightweight Directory Services Tools"

Some 'features on demand' you may find yourself needing:

- [Remote server administration tools](../active_directory/get-adgroup.md) - for querying AD (and more)
- [Hyper-V](../virtual_box/virtual_box_requires_hyper_v_disabled.md) --
- Various language/input features

## Install via DISM

Optional features, also known as FODs - Feature On Demand  - can also be installed via `DISM /add-capability`.

What is `DISM` ??

- "Deployment Image Servicing and Management Tool (DISM)"

	> get-command DISM.exe

	CommandType     Name        Version    Source
	-----------     ----        -------    ------
	Application     Dism.exe    10.0.19... C:\windows\system32\Dism.exe

To list all the features (whiether installed or not)

	DISM /Online /Get-Capabilities

...this will list many capabilities (why are they sometmies called 'optional features','feature on demand','Capabilities' ... which is it!?!?!)

This will list details of a specific capability...

	DISM /Online /Get-CapabilityInfo /CapabilityName:Language.Basic~en-US~0.0.1.0

Here's a list of all at a specific point in time:

| Capability | State |
|------------|-------|
| Accessibility.Braille~~~~0.0.1.0 | Not Present|
| Analog.Holographic.Desktop~~~~0.0.1.0 | Not Present|
| App.Support.QuickAssist~~~~0.0.1.0 | Not Present|
| Browser.InternetExplorer~~~~0.0.11.0 | Installed|
| Hello.Face.17658~~~~0.0.1.0 | Installed|
| Hello.Face.Migration.17658~~~~0.0.1.0 | Not Present|
| Language.Basic~~~af-ZA~0.0.1.0 | Not Present|
| Language.Basic~~~ar-SA~0.0.1.0 | Not Present|
| Language.Basic~~~as-IN~0.0.1.0 | Not Present|
| Language.Basic~~~az-LATN-AZ~0.0.1.0 | Not Present|
| Language.Basic~~~ba-RU~0.0.1.0 | Not Present|
| Language.Basic~~~be-BY~0.0.1.0 | Not Present|
| Language.Basic~~~bg-BG~0.0.1.0 | Not Present|
| Language.Basic~~~bn-BD~0.0.1.0 | Not Present|
| Language.Basic~~~bn-IN~0.0.1.0 | Not Present|
| Language.Basic~~~bs-LATN-BA~0.0.1.0 | Not Present|
| Language.Basic~~~ca-ES~0.0.1.0 | Not Present|
| Language.Basic~~~cs-CZ~0.0.1.0 | Not Present|
| Language.Basic~~~cy-GB~0.0.1.0 | Not Present|
| Language.Basic~~~da-DK~0.0.1.0 | Not Present|
| Language.Basic~~~de-DE~0.0.1.0 | Not Present|
| Language.Basic~~~el-GR~0.0.1.0 | Not Present|
| Language.Basic~~~en-GB~0.0.1.0 | Not Present|
| Language.Basic~~~en-US~0.0.1.0 | Installed|
| Language.Basic~~~es-ES~0.0.1.0 | Not Present|
| Language.Basic~~~es-MX~0.0.1.0 | Not Present|
| Language.Basic~~~et-EE~0.0.1.0 | Not Present|
| Language.Basic~~~eu-ES~0.0.1.0 | Not Present|
| Language.Basic~~~fa-IR~0.0.1.0 | Not Present|
| Language.Basic~~~fi-FI~0.0.1.0 | Not Present|
| Language.Basic~~~fil-PH~0.0.1.0 | Not Present|
| Language.Basic~~~fr-CA~0.0.1.0 | Not Present|
| Language.Basic~~~fr-FR~0.0.1.0 | Not Present|
| Language.Basic~~~ga-IE~0.0.1.0 | Not Present|
| Language.Basic~~~gd-GB~0.0.1.0 | Not Present|
| Language.Basic~~~gl-ES~0.0.1.0 | Not Present|
| Language.Basic~~~gu-IN~0.0.1.0 | Not Present|
| Language.Basic~~~ha-LATN-NG~0.0.1.0 | Not Present|
| Language.Basic~~~haw-US~0.0.1.0 | Not Present|
| Language.Basic~~~he-IL~0.0.1.0 | Not Present|
| Language.Basic~~~hi-IN~0.0.1.0 | Not Present|
| Language.Basic~~~hr-HR~0.0.1.0 | Not Present|
| Language.Basic~~~hu-HU~0.0.1.0 | Not Present|
| Language.Basic~~~hy-AM~0.0.1.0 | Not Present|
| Language.Basic~~~id-ID~0.0.1.0 | Not Present|
| Language.Basic~~~ig-NG~0.0.1.0 | Not Present|
| Language.Basic~~~is-IS~0.0.1.0 | Not Present|
| Language.Basic~~~it-IT~0.0.1.0 | Not Present|
| Language.Basic~~~ja-JP~0.0.1.0 | Not Present|
| Language.Basic~~~ka-GE~0.0.1.0 | Not Present|
| Language.Basic~~~kk-KZ~0.0.1.0 | Not Present|
| Language.Basic~~~kl-GL~0.0.1.0 | Not Present|
| Language.Basic~~~kn-IN~0.0.1.0 | Not Present|
| Language.Basic~~~ko-KR~0.0.1.0 | Not Present|
| Language.Basic~~~kok-DEVA-IN~0.0.1.0 | Not Present|
| Language.Basic~~~ky-KG~0.0.1.0 | Not Present|
| Language.Basic~~~lb-LU~0.0.1.0 | Not Present|
| Language.Basic~~~lt-LT~0.0.1.0 | Not Present|
| Language.Basic~~~lv-LV~0.0.1.0 | Not Present|
| Language.Basic~~~mi-NZ~0.0.1.0 | Not Present|
| Language.Basic~~~mk-MK~0.0.1.0 | Not Present|
| Language.Basic~~~ml-IN~0.0.1.0 | Not Present|
| Language.Basic~~~mn-MN~0.0.1.0 | Not Present|
| Language.Basic~~~mr-IN~0.0.1.0 | Not Present|
| Language.Basic~~~ms-BN~0.0.1.0 | Not Present|
| Language.Basic~~~ms-MY~0.0.1.0 | Not Present|
| Language.Basic~~~mt-MT~0.0.1.0 | Not Present|
| Language.Basic~~~nb-NO~0.0.1.0 | Not Present|
| Language.Basic~~~ne-NP~0.0.1.0 | Not Present|
| Language.Basic~~~nl-NL~0.0.1.0 | Not Present|
| Language.Basic~~~nn-NO~0.0.1.0 | Not Present|
| Language.Basic~~~nso-ZA~0.0.1.0 | Not Present|
| Language.Basic~~~or-IN~0.0.1.0 | Not Present|
| Language.Basic~~~pa-IN~0.0.1.0 | Not Present|
| Language.Basic~~~pl-PL~0.0.1.0 | Not Present|
| Language.Basic~~~ps-AF~0.0.1.0 | Not Present|
| Language.Basic~~~pt-BR~0.0.1.0 | Not Present|
| Language.Basic~~~pt-PT~0.0.1.0 | Not Present|
| Language.Basic~~~rm-CH~0.0.1.0 | Not Present|
| Language.Basic~~~ro-RO~0.0.1.0 | Not Present|
| Language.Basic~~~ru-RU~0.0.1.0 | Not Present|
| Language.Basic~~~rw-RW~0.0.1.0 | Not Present|
| Language.Basic~~~sah-RU~0.0.1.0 | Not Present|
| Language.Basic~~~si-LK~0.0.1.0 | Not Present|
| Language.Basic~~~sk-SK~0.0.1.0 | Not Present|
| Language.Basic~~~sl-SI~0.0.1.0 | Not Present|
| Language.Basic~~~sq-AL~0.0.1.0 | Not Present|
| Language.Basic~~~sr-CYRL-RS~0.0.1.0 | Not Present|
| Language.Basic~~~sr-LATN-RS~0.0.1.0 | Not Present|
| Language.Basic~~~sv-SE~0.0.1.0 | Not Present|
| Language.Basic~~~sw-KE~0.0.1.0 | Not Present|
| Language.Basic~~~ta-IN~0.0.1.0 | Not Present|
| Language.Basic~~~te-IN~0.0.1.0 | Not Present|
| Language.Basic~~~tg-CYRL-TJ~0.0.1.0 | Not Present|
| Language.Basic~~~th-TH~0.0.1.0 | Not Present|
| Language.Basic~~~tk-TM~0.0.1.0 | Not Present|
| Language.Basic~~~tn-ZA~0.0.1.0 | Not Present|
| Language.Basic~~~tr-TR~0.0.1.0 | Not Present|
| Language.Basic~~~tt-RU~0.0.1.0 | Not Present|
| Language.Basic~~~ug-CN~0.0.1.0 | Not Present|
| Language.Basic~~~uk-UA~0.0.1.0 | Not Present|
| Language.Basic~~~ur-PK~0.0.1.0 | Not Present|
| Language.Basic~~~uz-LATN-UZ~0.0.1.0 | Not Present|
| Language.Basic~~~vi-VN~0.0.1.0 | Not Present|
| Language.Basic~~~wo-SN~0.0.1.0 | Not Present|
| Language.Basic~~~xh-ZA~0.0.1.0 | Not Present|
| Language.Basic~~~yo-NG~0.0.1.0 | Not Present|
| Language.Basic~~~zh-CN~0.0.1.0 | Not Present|
| Language.Basic~~~zh-HK~0.0.1.0 | Not Present|
| Language.Basic~~~zh-TW~0.0.1.0 | Not Present|
| Language.Basic~~~zu-ZA~0.0.1.0 | Not Present|
| Language.Fonts.Arab~~~und-ARAB~0.0.1.0 | Not Present|
| Language.Fonts.Beng~~~und-BENG~0.0.1.0 | Not Present|
| Language.Fonts.Cans~~~und-CANS~0.0.1.0 | Not Present|
| Language.Fonts.Cher~~~und-CHER~0.0.1.0 | Not Present|
| Language.Fonts.Deva~~~und-DEVA~0.0.1.0 | Not Present|
| Language.Fonts.Ethi~~~und-ETHI~0.0.1.0 | Not Present|
| Language.Fonts.Gujr~~~und-GUJR~0.0.1.0 | Not Present|
| Language.Fonts.Guru~~~und-GURU~0.0.1.0 | Not Present|
| Language.Fonts.Hans~~~und-HANS~0.0.1.0 | Not Present|
| Language.Fonts.Hant~~~und-HANT~0.0.1.0 | Not Present|
| Language.Fonts.Hebr~~~und-HEBR~0.0.1.0 | Not Present|
| Language.Fonts.Jpan~~~und-JPAN~0.0.1.0 | Not Present|
| Language.Fonts.Khmr~~~und-KHMR~0.0.1.0 | Not Present|
| Language.Fonts.Knda~~~und-KNDA~0.0.1.0 | Not Present|
| Language.Fonts.Kore~~~und-KORE~0.0.1.0 | Not Present|
| Language.Fonts.Laoo~~~und-LAOO~0.0.1.0 | Not Present|
| Language.Fonts.Mlym~~~und-MLYM~0.0.1.0 | Not Present|
| Language.Fonts.Orya~~~und-ORYA~0.0.1.0 | Not Present|
| Language.Fonts.PanEuropeanSupplementalFonts~~~~0.0.1.0 | Not Present|
| Language.Fonts.Sinh~~~und-SINH~0.0.1.0 | Not Present|
| Language.Fonts.Syrc~~~und-SYRC~0.0.1.0 | Not Present|
| Language.Fonts.Taml~~~und-TAML~0.0.1.0 | Not Present|
| Language.Fonts.Telu~~~und-TELU~0.0.1.0 | Not Present|
| Language.Fonts.Thai~~~und-THAI~0.0.1.0 | Not Present|
| Language.Handwriting~~~af-ZA~0.0.1.0 | Not Present|
| Language.Handwriting~~~bs-LATN-BA~0.0.1.0 | Not Present|
| Language.Handwriting~~~ca-ES~0.0.1.0 | Not Present|
| Language.Handwriting~~~cs-CZ~0.0.1.0 | Not Present|
| Language.Handwriting~~~cy-GB~0.0.1.0 | Not Present|
| Language.Handwriting~~~da-DK~0.0.1.0 | Not Present|
| Language.Handwriting~~~de-DE~0.0.1.0 | Not Present|
| Language.Handwriting~~~el-GR~0.0.1.0 | Not Present|
| Language.Handwriting~~~en-GB~0.0.1.0 | Not Present|
| Language.Handwriting~~~en-US~0.0.1.0 | Installed|
| Language.Handwriting~~~es-ES~0.0.1.0 | Not Present|
| Language.Handwriting~~~es-MX~0.0.1.0 | Not Present|
| Language.Handwriting~~~eu-ES~0.0.1.0 | Not Present|
| Language.Handwriting~~~fi-FI~0.0.1.0 | Not Present|
| Language.Handwriting~~~fr-FR~0.0.1.0 | Not Present|
| Language.Handwriting~~~ga-IE~0.0.1.0 | Not Present|
| Language.Handwriting~~~gd-GB~0.0.1.0 | Not Present|
| Language.Handwriting~~~gl-ES~0.0.1.0 | Not Present|
| Language.Handwriting~~~hi-IN~0.0.1.0 | Not Present|
| Language.Handwriting~~~hr-HR~0.0.1.0 | Not Present|
| Language.Handwriting~~~id-ID~0.0.1.0 | Not Present|
| Language.Handwriting~~~it-IT~0.0.1.0 | Not Present|
| Language.Handwriting~~~ja-JP~0.0.1.0 | Not Present|
| Language.Handwriting~~~ko-KR~0.0.1.0 | Not Present|
| Language.Handwriting~~~lb-LU~0.0.1.0 | Not Present|
| Language.Handwriting~~~mi-NZ~0.0.1.0 | Not Present|
| Language.Handwriting~~~ms-BN~0.0.1.0 | Not Present|
| Language.Handwriting~~~ms-MY~0.0.1.0 | Not Present|
| Language.Handwriting~~~nb-NO~0.0.1.0 | Not Present|
| Language.Handwriting~~~nl-NL~0.0.1.0 | Not Present|
| Language.Handwriting~~~nn-NO~0.0.1.0 | Not Present|
| Language.Handwriting~~~nso-ZA~0.0.1.0 | Not Present|
| Language.Handwriting~~~pl-PL~0.0.1.0 | Not Present|
| Language.Handwriting~~~pt-BR~0.0.1.0 | Not Present|
| Language.Handwriting~~~pt-PT~0.0.1.0 | Not Present|
| Language.Handwriting~~~rm-CH~0.0.1.0 | Not Present|
| Language.Handwriting~~~ro-RO~0.0.1.0 | Not Present|
| Language.Handwriting~~~ru-RU~0.0.1.0 | Not Present|
| Language.Handwriting~~~rw-RW~0.0.1.0 | Not Present|
| Language.Handwriting~~~sk-SK~0.0.1.0 | Not Present|
| Language.Handwriting~~~sl-SI~0.0.1.0 | Not Present|
| Language.Handwriting~~~sq-AL~0.0.1.0 | Not Present|
| Language.Handwriting~~~sr-CYRL-RS~0.0.1.0 | Not Present|
| Language.Handwriting~~~sr-LATN-RS~0.0.1.0 | Not Present|
| Language.Handwriting~~~sv-SE~0.0.1.0 | Not Present|
| Language.Handwriting~~~sw-KE~0.0.1.0 | Not Present|
| Language.Handwriting~~~tn-ZA~0.0.1.0 | Not Present|
| Language.Handwriting~~~tr-TR~0.0.1.0 | Not Present|
| Language.Handwriting~~~wo-SN~0.0.1.0 | Not Present|
| Language.Handwriting~~~xh-ZA~0.0.1.0 | Not Present|
| Language.Handwriting~~~zh-CN~0.0.1.0 | Not Present|
| Language.Handwriting~~~zh-HK~0.0.1.0 | Not Present|
| Language.Handwriting~~~zh-TW~0.0.1.0 | Not Present|
| Language.Handwriting~~~zu-ZA~0.0.1.0 | Not Present|
| Language.OCR~~~ar-SA~0.0.1.0 | Not Present|
| Language.OCR~~~bg-BG~0.0.1.0 | Not Present|
| Language.OCR~~~bs-LATN-BA~0.0.1.0 | Not Present|
| Language.OCR~~~cs-CZ~0.0.1.0 | Not Present|
| Language.OCR~~~da-DK~0.0.1.0 | Not Present|
| Language.OCR~~~de-DE~0.0.1.0 | Not Present|
| Language.OCR~~~el-GR~0.0.1.0 | Not Present|
| Language.OCR~~~en-GB~0.0.1.0 | Not Present|
| Language.OCR~~~en-US~0.0.1.0 | Installed|
| Language.OCR~~~es-ES~0.0.1.0 | Not Present|
| Language.OCR~~~es-MX~0.0.1.0 | Not Present|
| Language.OCR~~~fi-FI~0.0.1.0 | Not Present|
| Language.OCR~~~fr-CA~0.0.1.0 | Not Present|
| Language.OCR~~~fr-FR~0.0.1.0 | Not Present|
| Language.OCR~~~hr-HR~0.0.1.0 | Not Present|
| Language.OCR~~~hu-HU~0.0.1.0 | Not Present|
| Language.OCR~~~it-IT~0.0.1.0 | Not Present|
| Language.OCR~~~ja-JP~0.0.1.0 | Not Present|
| Language.OCR~~~ko-KR~0.0.1.0 | Not Present|
| Language.OCR~~~nb-NO~0.0.1.0 | Not Present|
| Language.OCR~~~nl-NL~0.0.1.0 | Not Present|
| Language.OCR~~~pl-PL~0.0.1.0 | Not Present|
| Language.OCR~~~pt-BR~0.0.1.0 | Not Present|
| Language.OCR~~~pt-PT~0.0.1.0 | Not Present|
| Language.OCR~~~ro-RO~0.0.1.0 | Not Present|
| Language.OCR~~~ru-RU~0.0.1.0 | Not Present|
| Language.OCR~~~sk-SK~0.0.1.0 | Not Present|
| Language.OCR~~~sl-SI~0.0.1.0 | Not Present|
| Language.OCR~~~sr-CYRL-RS~0.0.1.0 | Not Present|
| Language.OCR~~~sr-LATN-RS~0.0.1.0 | Not Present|
| Language.OCR~~~sv-SE~0.0.1.0 | Not Present|
| Language.OCR~~~tr-TR~0.0.1.0 | Not Present|
| Language.OCR~~~zh-CN~0.0.1.0 | Not Present|
| Language.OCR~~~zh-HK~0.0.1.0 | Not Present|
| Language.OCR~~~zh-TW~0.0.1.0 | Not Present|
| Language.Speech~~~de-DE~0.0.1.0 | Not Present|
| Language.Speech~~~en-AU~0.0.1.0 | Not Present|
| Language.Speech~~~en-CA~0.0.1.0 | Not Present|
| Language.Speech~~~en-GB~0.0.1.0 | Not Present|
| Language.Speech~~~en-IN~0.0.1.0 | Not Present|
| Language.Speech~~~en-US~0.0.1.0 | Not Present|
| Language.Speech~~~es-ES~0.0.1.0 | Not Present|
| Language.Speech~~~es-MX~0.0.1.0 | Not Present|
| Language.Speech~~~fr-CA~0.0.1.0 | Not Present|
| Language.Speech~~~fr-FR~0.0.1.0 | Not Present|
| Language.Speech~~~it-IT~0.0.1.0 | Not Present|
| Language.Speech~~~ja-JP~0.0.1.0 | Not Present|
| Language.Speech~~~pt-BR~0.0.1.0 | Not Present|
| Language.Speech~~~zh-CN~0.0.1.0 | Not Present|
| Language.Speech~~~zh-HK~0.0.1.0 | Not Present|
| Language.Speech~~~zh-TW~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~ar-EG~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~ar-SA~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~bg-BG~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~ca-ES~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~cs-CZ~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~da-DK~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~de-AT~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~de-CH~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~de-DE~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~el-GR~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~en-AU~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~en-CA~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~en-GB~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~en-IE~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~en-IN~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~en-US~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~es-ES~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~es-MX~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~fi-FI~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~fr-CA~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~fr-CH~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~fr-FR~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~he-IL~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~hi-IN~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~hr-HR~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~hu-HU~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~id-ID~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~it-IT~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~ja-JP~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~ko-KR~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~ms-MY~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~nb-NO~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~nl-BE~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~nl-NL~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~pl-PL~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~pt-BR~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~pt-PT~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~ro-RO~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~ru-RU~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~sk-SK~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~sl-SI~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~sv-SE~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~ta-IN~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~th-TH~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~tr-TR~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~vi-VN~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~zh-CN~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~zh-HK~0.0.1.0 | Not Present|
| Language.TextToSpeech~~~zh-TW~0.0.1.0 | Not Present|
| MathRecognizer~~~~0.0.1.0 | Installed|
| Media.WindowsMediaPlayer~~~~0.0.12.0 | Installed|
| Microsoft.Onecore.StorageManagement~~~~0.0.1.0 | Not Present|
| Microsoft.WebDriver~~~~0.0.1.0 | Not Present|
| Microsoft.Windows.StorageManagement~~~~0.0.1.0 | Not Present|
| Msix.PackagingTool.Driver~~~~0.0.1.0 | Not Present|
| NetFX3~~~~ | Installed|
| OneCoreUAP.OneSync~~~~0.0.1.0 | Installed|
| OpenSSH.Client~~~~0.0.1.0 | Installed|
| OpenSSH.Server~~~~0.0.1.0 | Not Present|
| RasCMAK.Client~~~~0.0.1.0 | Not Present|
| RIP.Listener~~~~0.0.1.0 | Not Present|
| Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0 | Installed|
| Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0 | Not Present|
| Rsat.CertificateServices.Tools~~~~0.0.1.0 | Not Present|
| Rsat.DHCP.Tools~~~~0.0.1.0 | Not Present|
| Rsat.Dns.Tools~~~~0.0.1.0 | Not Present|
| Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0 | Not Present|
| Rsat.FileServices.Tools~~~~0.0.1.0 | Not Present|
| Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0 | Not Present|
| Rsat.IPAM.Client.Tools~~~~0.0.1.0 | Not Present|
| Rsat.LLDP.Tools~~~~0.0.1.0 | Not Present|
| Rsat.NetworkController.Tools~~~~0.0.1.0 | Not Present|
| Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0 | Not Present|
| Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0 | Not Present|
| Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0 | Not Present|
| Rsat.ServerManager.Tools~~~~0.0.1.0 | Installed|
| Rsat.Shielded.VM.Tools~~~~0.0.1.0 | Not Present|
| Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0 | Not Present|
| Rsat.StorageReplica.Tools~~~~0.0.1.0 | Not Present|
| Rsat.SystemInsights.Management.Tools~~~~0.0.1.0 | Not Present|
| Rsat.VolumeActivation.Tools~~~~0.0.1.0 | Not Present|
| Rsat.WSUS.Tools~~~~0.0.1.0 | Not Present|
| SNMP.Client~~~~0.0.1.0 | Not Present|
| Tools.DeveloperMode.Core~~~~0.0.1.0 | Not Present|
| Tools.DTrace.Platform~~~~0.0.1.0 | Not Present|
| Tools.Graphics.DirectX~~~~0.0.1.0 | Installed|
| WMI-SNMP-Provider.Client~~~~0.0.1.0 | Not Present|
| XPS.Viewer~~~~0.0.1.0 | Not Present|

You can find out more about any one of those via:

	DISM /Online /Get-CapabilityInfo /CapabilityName:Language.Basic~~~en-US~0.0.1.0

...from an elevated console.

~~~

Read [More about DISM.](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/dism-capabilities-package-servicing-command-line-options)

## Sources

- [All RSAT Components](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-non-language-fod#remote-server-administration-tools-rsat)
- [DISM: Add Capability](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-v2--capabilities#using-dism-add-capability-to-add-or-remove-fods)
- [What is DISM](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/what-is-dism)

## See also

- [Get-AdGroup in powershell via RSAT (Remote server administration tools)](../active_directory/get-adgroup.md)
- [Powershell: get-aduser is useful to get info about a user account](../powershell/get_aduser.md)
- [Virtual Box requires Hyper-V to be disabled](../virtual_box/virtual_box_requires_hyper_v_disabled.md)