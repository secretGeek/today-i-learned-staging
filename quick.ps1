write-host -NoNewline "Getting TIL content from util subfolder" -foregroundcolor   "white"

.\get.ps1


. .\get-title.ps1

write-host "...DONE" -foregroundcolor   "green"

write-host -NoNewline "Putting chapter summary into each folder" -foregroundcolor   "white"

Get-ChildItem . | 
    Where-Object { $_.PSIsContainer -and ($_.Name -ne ".hg") -and ($_.Name -ne "_book") -and ($_.Name -ne ".git") -and ($_.Name -ne "node_modules") } | 
    ForEach-Object { Copy-Item .\chapter_summary.txt (".\" + $_.Name + "\01_summary.md.pre") }

write-host "...DONE" -foregroundcolor   "green"

write-host -NoNewline "Adding list of topics to ReadMe" -foregroundcolor   "white"

Add-Content .\readme.md "`r`n`r`n## Topics`r`n"  
$totalCount = 0;

$topLevelTopics = (Get-ChildItem . |
     Where-Object { $_.PSIsContainer -and ($_.Name -ne ".hg") -and ($_.Name -ne "_book") -and ($_.Name -ne ".git") -and ($_.Name -ne "node_modules") } |
        ForEach-Object { 
            $count = (Get-ChildItem ($_.Name) *.md -recurse |
                        Where-Object { !$_.PSIsContainer -and ($_.Name -ne "01_summary.md") -and ($_.Name -ne "summary.md") } | 
                            measure-object).Count
            $totalCount += $count;                
            #" * [{0}]({1}/01_summary.md) &mdash; {2} article{3}" -f $_.Name.replace("_"," "), $_.Name, $count, (plural $count "s") 
            "| [{0}]({1}/01_summary.md) | {2} article{3} |`n" -f $_.Name.replace("_"," "), $_.Name, $count, (plural $count "s") 
        }
    )

$topLevelTopics = ("|Topic|# Articles|`n|-----|----------|`n" + $topLevelTopics)
Add-Content .\readme.md $topLevelTopics
Add-Content .\readme.md ("`r`n{0} articles" -f $totalCount)
Add-Content .\readme.md (.\wordcount.ps1)

write-host "...DONE" -foregroundcolor   "green"
 

write-host "Building summary.md and chapter summaries using pre -- the friendly pre-processor" -foregroundcolor   "white"

pre

write-host "...DONE" -foregroundcolor   "green"

write-host "NOT Building book with gitbook, so you can see it for yourself." -foregroundcolor   "white"
# gitbook install  # re-installs all plugins
# gitbook build .

#write-host "Suggestions: " -foregroundcolor   "white"
#write-host " * to see in browser: gitbook serve .; browse to http://localhost:4000/"
#write-host " * see in editor: n _book\index.html"
write-host " * git add *; git commit . -m 'blah blah'; kp git; git push"
write-host ""

write-host -NoNewline "TODO Items: " -foregroundcolor   "white"
.\todo.ps1
write-host -NoNewline "Word count: " -foregroundcolor   "white"
.\wordcount.ps1
write-host -NoNewline "File count: " -foregroundcolor   "white"
.\filecount.ps1