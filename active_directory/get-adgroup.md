# Get-AdGroup in powershell via RSAT (Remote server administration tools)

Traditionally I use some C# Linq files to query active directory, but they're a bit of a mess. I was trying to get some help online and most articles talked about using powershell cmdlets like `Get-ADGroup`

(Other people use `ADSI Edit`, `C:\windows\system32\adsiedit.msc`)

To get this module you need to install "RSAT" or "Remote Server Administration Tools". In Windows 10, this is available as an optional feature.

	Start Menu |
		Apps & Features |
			Manage Optional Features |
				Add a feature |
					"RSAT: Active Directory Domain Services and Lightweight Directory Services Tools"

...bit of a mouthful. (There are a lot of other RSAT features to pick from.)

## Details of a group

Once that's installed, you can get Ad group info via:

	get-adgroup "THE-GROUPS-NAME" -properties *

## Details of a user

And similarly:

	get-aduser "my-user-name" -properties *

Usually I want:

- [Details of a user]
- [Details of a group]
- [Which groups is a user in?]
- [Which users are in a group?]
- [When was the user's password last set?]

## Which groups is a user in?

	(Get-ADUser "MyUser" -Properties MemberOf).MemberOf

But since the results are in "X.500 Directory Specification" which looks like this....

	CN=GroupNameHere,OU=AnOrgUnit3,OU=AnOrgUnit2,OU=AnOrgUnit1,DC=aDomainComponent3,DC=aDomainComponent2,DC=aDomainComponent1

...and we only want the group name (say) -- we can split it by the commas, then keep only the bits that start with "CN=" and then split that on the equals sign and keep the values of the first item in the result.

	(Get-ADUser "leon.bambrick" -Properties MemberOf).MemberOf | % { ($_ -split "," -like "CN=*" -split "=" )[1] }

(I did like this alternative form [at serverfault from user Canoas](https://serverfault.com/a/594724/17154) which doesn't rely on RSAT....

	(New-Object System.DirectoryServices.DirectorySearcher("(&(objectCategory=User)(samAccountName=$($env:username)))")).FindOne().GetDirectoryEntry().memberOf

...)

## Which users are in a group?

	Get-ADGroupMember

e.g.

	get-adgroupmember "A-SPECIAL-GROUP" | % SamAccountName



Don't have RSAT? Try this technique:

	(New-Object System.DirectoryServices.DirectorySearcher("(&(objectCategory=Group)(samAccountName=$('A-SPECIAL-GROUP')))")).FindOne().Properties.member

## When was the user's password last set?

	$userName = "my-user-name"
	(Get-ADUser -Identity $userName -Properties "PasswordLastSet")."PasswordLastSet"

(Can be the best way to guess when it will be reset/expire..)

## Try to find the property you want to find

What if we want to find all properties that mention "pass" -- we can do it like this:

	(Get-ADUser "leon.bambrick" -Properties "*") | get-member | ? { $_.MemberType -eq "Property" -and $_.Name -like "*pass*" }

Then we use the syntax in the examples above to fetch and return that property.


Or without RSAT, show all of the properties for a user....

   (New-Object System.DirectoryServices.DirectorySearcher("(&(objectCategory=User)(samAccountName=$('leon.bambrick')))")).FindOne().Properties

Or just show the property names (still without RSAT)

   (New-Object System.DirectoryServices.DirectorySearcher("(&(objectCategory=User)(samAccountName=$('leon.bambrick')))")).FindOne().Properties.Keys

Or (still without RSAT) search for a property that matches a pattern:


   (New-Object System.DirectoryServices.DirectorySearcher("(&(objectCategory=User)(samAccountName=$($ENV:UserName)))")).FindOne().Properties |
      % { $xx = $_; $_.Keys  | ? { $_ -like "*pass*"} | % { write-host "$_" -f yellow -n; write-host "`t`t$($xx[$_])" -f white } }




## Find user details of a user from a different Domain Controller

Say I'm on a subnet called `Australia.Company.Example.Com` and the user account I want to inspect if from the parent domain, `Company.Example.Com` -- don't prefix the domain before the user... specifiy `server=` parameter!

	get-aduser "USER-NAME" -server "Company.Example.com" -properties *

## Convert `badPasswordTime` and or accountExpires from 18 digit LDAP time to DateTime

Some dates are 18 digits long and represent "the number of 100-nanosecond intervals that have elapsed since the 0 hour on January 1, 1601"

	> w32tm.exe /ntte "131755762378066802"
	152495 02:17:17.8066802 - 9/07/2018 12:17:17 PM

	accountExpires                       : 9223372036854775807

	>w32tm.exe /ntte "9223372036854775807"
	10675199 02:48:05.4775807 -

see [How to convert date/time attributes in Active Directory to standard time format](https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/convert-datetime-attributes-to-standard-format)

## All other `Get` methods in `RSAT`

In fact here's all the 'get' methods that are available:

(Find this via:

	get-command get-* | ? { $_.Source -eq "ActiveDirectory" } | % Name

...)

- `Get-ADAccountAuthorizationGroup`
- `Get-ADAccountResultantPasswordReplicationPolicy`
- `Get-ADAuthenticationPolicy`
- `Get-ADAuthenticationPolicySilo`
- `Get-ADCentralAccessPolicy`
- `Get-ADCentralAccessRule`
- `Get-ADClaimTransformPolicy`
- `Get-ADClaimType`
- `Get-ADComputer`
- `Get-ADComputerServiceAccount`
- `Get-ADDCCloningExcludedApplicationList`
- `Get-ADDefaultDomainPasswordPolicy`
- `Get-ADDomain`
- `Get-ADDomainController`
- `Get-ADDomainControllerPasswordReplicationPolicy`
- `Get-ADDomainControllerPasswordReplicationPolicyUsage`
- `Get-ADFineGrainedPasswordPolicy`
- `Get-ADFineGrainedPasswordPolicySubject`
- `Get-ADForest`
- `Get-ADGroup`
- `Get-ADGroupMember`
- `Get-ADObject`
- `Get-ADOptionalFeature`
- `Get-ADOrganizationalUnit`
- `Get-ADPrincipalGroupMembership`
- `Get-ADReplicationAttributeMetadata`
- `Get-ADReplicationConnection`
- `Get-ADReplicationFailure`
- `Get-ADReplicationPartnerMetadata`
- `Get-ADReplicationQueueOperation`
- `Get-ADReplicationSite`
- `Get-ADReplicationSiteLink`
- `Get-ADReplicationSiteLinkBridge`
- `Get-ADReplicationSubnet`
- `Get-ADReplicationUpToDatenessVectorTable`
- `Get-ADResourceProperty`
- `Get-ADResourcePropertyList`
- `Get-ADResourcePropertyValueType`
- `Get-ADRootDSE`
- `Get-ADServiceAccount`
- `Get-ADTrust`
- `Get-ADUser`
- `Get-ADUserResultantPasswordPolicy`

## See also

- [Powershell: get-aduser is useful to get info about a user account](../powershell/get_aduser.md)
- [Feature on demand](../windows/feature_on_demand.md) -- Optional features in Windows
