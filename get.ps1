#<#
$from = ($env:util + "\til\*")
$to = ($env:util + "\..\all_someday_projects\git_playground\today-i-learned-staging")
Copy-Item $from $to -recurse -force -exclude .ok
#>
<#
$from = ($env:util + "\til\")
$to = ($env:util + "\..\all_someday_projects\git_playground\today-i-learned-staging2")
#
#                /MIR :: MIRror a directory tree (equivalent to /E plus /PURGE).
#                /R:n :: number of Retries on failed copies: default 1 million.
#  /XF file [file]... :: eXclude Files matching given names/paths/wildcards.
#  /XD dirs [dirs]... :: eXclude Directories matching given names/paths.
robocopy "$from" "$to" /MIR /R:4 /XF .ok *.ps1 chapter_summary.txt .gitignore /XD .git
#>