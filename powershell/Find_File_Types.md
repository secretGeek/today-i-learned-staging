# Find File Types in a Folder


    dir *.* | % Extension | sort | Unique

Or to get them recursively...

    dir . *.* -rec | % Extension | sort | Unique