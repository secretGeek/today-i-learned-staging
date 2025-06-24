# Ignore Files in Dropbox

There is no `.gitignore` equivalent for Dropbox. 

But you can tell dropbox to ignore a specific file or folder:
- just set the file's `com.dropbox.ignored` stream to `1`.

(The "stream" we speak of here is an "alternate data stream" or `ADS` to the nerdliest. Files downloaded from the internet, for example, are "gifted" an extra stream, in windows, when stored in NTFS, called the `Zone.Identifier` stream, which contains `ZoneId`, `ReferrerUrl` and `HostUrl` keyvalue pairs.)

To undo the ignoring of the file or folder, clear the `com.dropbox.ignored` stream.

## Set the `com.dropbox.ignored` stream to 1

Set the stream's value

	Set-Content -Path '~\Dropbox\FileToIgnore.pdf' -Stream com.dropbox.ignored -Value 1
	Set-Content -Path '~\Dropbox\FolderToIgnore\' -Stream com.dropbox.ignored -Value 1

## See if the `com.dropbox.ignored` stream has been updated

Get the value of the stream...

	Get-Content -Path '~\Dropbox\FileToIgnore.pdf' -Stream com.dropbox.ignored
	Get-Content -Path '~\Dropbox\FolderToIgnore\' -Stream com.dropbox.ignored


## Clear the `com.dropbox.ignored` stream

	Clear-Content -Path '~\Dropbox\FolderToIgnore\' -Stream com.dropbox.ignored
	Clear-Content -Path '~\Dropbox\FolderToIgnore\' -Stream com.dropbox.ignored


## See all the streams that a file/folder has

	Get-item -Path '~\Dropbox\FolderToIgnore\FileToIgnore.pdf' -Stream * | select -prop stream, length

Returns (for example)

	Stream               Length
	------               ------
	:$DATA              1495529
	com.dropbox.ignored       3




## Source

- [Dropbox Ignored Files](https://help.dropbox.com/sync/ignored-files)
- [Understanding Alternate Data Streams (ADS) in Windows](https://www.komprise.com/glossary_terms/alternate-data-streams-ads/)
