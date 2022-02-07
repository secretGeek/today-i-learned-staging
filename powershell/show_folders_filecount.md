# Show Folders FileCount Filtered For Folders with 500 Files

Find just 500 file folders... (and skip looking in the `node_modules` directory)

    dir -dir -rec | ? { $_.FullName -notlike "*node_modules*" } | % { $name = $_.FullName; dir "$($_.FullName)" -file | measure | ? { $_.count -gt 500} | % { write-host "$name $($_.count)" -f darkcyan } }

Or if written out in full:

    Get-ChildItem -dir -rec |
    Where-Object {
        $_.FullName -notlike "*node_modules*"\
    } |
        ForEach-Object {
            $name = $_.FullName;
            Get-ChildItem "$($_.FullName)" -file |
                Measure-Object |
                Where-Object {
                    $_.count -gt 500
                } |
                ForEach-Object {
                    write-host "$name $($_.count)" -f darkcyan
                }
    }


Show files in all folders, but exclude node_modules, .git and .obj folders....

	 Get-ChildItem -dir -rec |
		Where-Object {
			$_.FullName -notlike "*node_modules*" -and
			$_.FullName -notlike "*\obj" -and
			$_.FullName -notlike "*\obj\*" -and
			$_.FullName -notlike "*\.git" -and
			$_.FullName -notlike "*\.git\*"
		} | % { Get-ChildItem "$($_.FullName)" *.* -file }


Just get some files, not all folders

    Get-ChildItem -dir -Exclude *node_modules*, .git, obj | % FullName |
        % { write-host "$_" -f yellow;
            Get-ChildItem $_ -file |
            % { write-host $_ -f blue; } }

## See also

- [Group objects in powershell](group_objects_in_powershell.md)