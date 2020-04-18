$from = ($env:util + "\til\*")
$to = ($env:util + "\..\all_someday_projects\git_playground\today-i-learned-staging")
Copy-Item $from $to -recurse -force -exclude .ok