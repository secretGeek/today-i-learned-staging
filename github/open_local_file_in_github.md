# Open Local File in Github (or Azure Devops)

If there is a local file, and you want to open github.com *at* that file (to inspect the history etc in the *website*)

You can use this little powershell function, `Show-Azuredevops`. (It's orginally built for Azure Devops... but works for Github too!)

As you'll see, it depends on two other functions, `Get-GitRemotePath` and `Get-GitLocalRootPath` which are defined in a subsequent code block.

```powershell
function Show-Azuredevops
{
	param($searchFilter)

    # Determine the correct azure instance to use!
	#
	# for example: "https://dev.azure.com/COMPANY/_git/REPONAME?path="; (for a given `COMPANY/REPONAME`)
	#
    # But if it's github we want:
	#
    #   "https://github.com/COMPANY/util/blob/master/REPONAME/" (for a given `COMPANY/REPONAME`)
	#
    # ...but it seems that the "?path=" construct as used by azure devops, gets redirected correctly for Github anyway!
    # (as long as you have permissions to view the file, with the github user of the browser that opens)
	#

    $remotePath = (Get-GitRemotePath);
    Write-Host "Remote path:" -f gray -n;
    Write-Host $remotePath -f yellow;

    $ado_base = ($remotePath + "?path=");
    Write-Host "SEARCHING FOR '$searchFilter'" -f green;
    $gitroot = (Get-GitLocalRootPath);
    if (-not (Test-Path $searchFilter) -and (Get-Location).path.ToLowerInvariant() -notlike "$gitroot*") {
        Write-Host "YOU'RE NOT CURRENTLY IN A git repo" -f green
        return;
    }

    if (Test-Path $searchFilter) {
        # e.g.                        C:\Apps\repos\CUST\REPO\SOME\FOLDER\SUBFOLDER\FILENAME.EXT which maps to:
        #   https://dev.azure.com/COMPANY/_git/REPONAME?path=/SOME/FOLDER/SUBFOLDER/FILENAME.EXT

        # turn $searchFilter, whioch is a fraction of a name into a full path....

        $fullPath = (Get-ChildItem $searchFilter |
                Select-Object -First 1 |
                ForEach-Object fullName);

        $relativePath = $fullPath -replace [regex]::escape($gitroot), '' # remove root path -- case-insensitive
        Write-Host "Relative path: " -f gray -n;
        Write-Host $relativePath -f yellow;
        $url = ($ado_base + $relativePath.replace("\", "/"));
        Write-Host $url -f magenta;
        browse $url;
        return;
    }
    return;
}
```

## Get-GitRemotePath Function

Here is the `Get-GitRemotePath` function (comments explain how it works, based on the command `git remote -v`)

```powershell
function Get-GitRemotePath() {
    # e.g.
    #   git remote -v
    #   origin  https://COMPANY@dev.azure.com/COMPANY/PROJECTNAME/_git/REPONAME (fetch)
    #   origin  https://COMPANY@dev.azure.com/COMPANY/PROJECTNAME/_git/REPONAME (push)
    #
    #   git remote -v | ? { $_ -like "*(fetch)" }
    #   origin  https://COMPANY@dev.azure.com/COMPANY/PROJECTNAME/_git/REPONAME (fetch)
    #
    #   git remote -v | ? { $_ -like "*(fetch)" } | % { ($_ -split "[`t ]")[1]}
    #   https://COMPANY@dev.azure.com/COMPANY/PROJECTNAME/_git/REPONAME
    #
    # ... and we remove any leading "COMPANY@" or "USERNAME@" (if present)...
    return (git remote -v |
            Where-Object { $_ -like "*(fetch)" } |
            ForEach-Object { ($_ -split "[`t ]")[1] }) -replace "//.*@", "//";
}
```


## Get-GitLocalRootPath Function

Here is the `Get-GitLocalRootPath` function.

This returns the name of the folder that the repo is inside, as a full path.


```powershell
function Get-GitLocalRootPath() {
    # e.g. C:\Apps\repos\CUST\REPO ... the folder that the repo is inside.
    return ((git rev-parse --show-toplevel) -replace "/", '\');
}
```



## See also

- [Open Local File in Azure Devops website (or Github website)](../azure_devops/open_local_file_in_azure_devops.md)