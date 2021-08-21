# Show Folders FileCount Filtered For Five Hundred File Folders

    dir -dir -rec | ? { $_.FullName -notlike "*node_modules*" } | % { $name = $_.FullName; dir "$($_.FullName)" -file | measure | ? { $_.count -gt 500} | % { write-host "$name $($_.count)" -f darkcyan } }
