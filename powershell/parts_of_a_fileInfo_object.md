﻿# Get Parts of a FileInfo object (such as FileName Without Extension)

...That would be the `BaseName`.

e.g.

    > Get-ChildItem . *.linq | ft -property BaseName
    calendar

Here's all the members of `FileInfo` that are most relevant:

Example:

    C:\users\user1\dropbox\secretGeek\util\linqPad\calendar.linq

- `Name` = "calendar.linq" (the name including the extension)
- `BaseName` = "calendar"  (the filename without extension)
- `Extension` = ".linq"   (the extension including the dot)
- `FullName` = "C:\users\user1\dropbox\secretGeek\util\linqPad\calendar.linq"
- `DirectoryName` = "C:\users\user1\dropbox\secretGeek\util\linqPad"
- `Directory` = a `DirectoryInfo` object where:
  - `Directory.Name` = "linqPad"
  - `Directory.FullName` = "C:\users\user1\dropbox\secretGeek\util\linqPad"
  - `Directory.Root` = a `DirectoryInfo` object (and as string == "C:\")
  - `Directory.Parent` = a `DirectoryInfo` object where:
    - `Directory.Parent.Name` = "util"

(`FileInfo` and `DirectoryInfo` --  both derive from `FileSystemInfo`)

## See also

- [How to find parts of a pathinfo object in powershell](how_to_find_parts_of_a_pathinfo_object.md)
- [How to turn a string into a FileInfo in Powershell](how_to_turn_a_string_into_a_fileinfo.md)