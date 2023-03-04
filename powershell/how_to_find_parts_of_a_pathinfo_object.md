# How to find parts of a pathinfo object in powershell

`Get-Location` (which I call `pwd`) returns a `PathInfo`

A `System.Management.Automation.PathInfo`.

It has four Properties of great use (and here is an example for each)

- **Drive** -- `C:\` -- `PSDriveInfo` object
- **Path**         -- `C:\users\example\experiments` -- `string`
- **Provider**     -- `Microsoft.PowerShell.Core\FileSystem` -- `Provider` object
- **ProviderPath** -- `C:\users\example\experiments` -- `string`

## See also

- [Get Parts of a FileInfo object (such as FileName Without Extension)](parts_of_a_fileInfo_object.md)
- [How to turn a string into a FileInfo in Powershell](how_to_turn_a_string_into_a_fileinfo.md)
