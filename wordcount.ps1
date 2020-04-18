dir . *.md -recurse |
    ? { !$_.PSIsContainer -and 
    ($_.Name -ne "01_summary.md") -and 
    ($_.Name -ne "summary.md") -and 
    !($_.FullName -match "node_modules") -and
    !($_.FullName -match "_book")} | 
    get-content | 
    measure-object -Word | 
    % {  "" + $_.Words + " words"}
