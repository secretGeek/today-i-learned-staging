dir . *.md -recurse |
    ? { !$_.PSIsContainer -and ($_.Name -ne "01_summary.md") -and ($_.Name -ne "summary.md") -and !($_.FullName -match "node_modules")} |
    measure-object  | 
    % {  " {0} files " -f $_.Count}
