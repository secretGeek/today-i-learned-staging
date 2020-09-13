# Find all the TODO's in a file or folder

	function todo()
	{
		# recursively search for TODO followed by colon, or [ ] with an underscore in between.
		findtext ("TODO" + ":|\[_\]")
	}

...which relies on my ever-evolving sense of 'findtext'

Currently something like.... (this is dynamically loaded from util)

	[string[]] $fileTypes = "*.md","*.fmw","*.txt","*.cs","*.cshtml","*.css","*.ps1","*.js","*.bat","*.vbs","*.vb","*.xml","*.config","*.htm","*.html","*.pre","*.ini","*.sql","*.linq","*.json","*.spark","*.ts","*.psm1","*.psd1","*.aspx","*.ascx","*.asp","*.asmx","*.pubxml","*.dgml","*.sln","*.*proj","*.spark","*.rdl","*.py","*.log","*.las","*.ascx", "*.inc", "*.xaml","*.sh","*.csv","*.tsv","*.php","*.ok"
	
	#Consider: asa asax ascx ashx asmx asp aspq aspx cfg cfm class config cs cshtm cshtml css csv dbml htaccess htm html ini inc install js log master module mxml php phps pl py readme restext resx script settings sitemap skin sql svc text txt vb vbhtm vbhtml vbs xaml xml xoml xsd xsl xslt
	#function findtext_norecurse($pattern)
	#function findtext_raw($pattern)
	#function findtext_raw_type($pattern, $recursive)
	#function findtext_raw_casesensitive($pattern)
	#function findtext_type($types, $pattern, $recursive){
	
	## Commands:
	## findtext $pattern   <-- search all text type files for a particular regex
	###                       if it's not valid as a regex we'll treat it as a literal string.
	## findtext_raw $pattern   <-- search all text type files for a literal string.
	## findtext_type $types $pattern $recurse   <-- e.g. findtext
	## findtext_raw $pattern   <-- search all text type files for a literal string.
	## findtext_raw_type $pattern   <-- search all text type files for a literal string.
	## pre_help          <-- help on pre
	## pre_help_detailed <-- verbose help on pre, with details about codeblocks.
	
	
	function findtext($pattern, $recursive)
	{
	    if ($null -eq $pattern) {
	        write-host "Please provide a pattern you wish to find. (all text files will be searched)" -foregroundcolor  "red"
	        return
	    }
	
	    if ($null -eq $recursive) {
	        #"SETTING RECURSIVE"
	        $recursive = $true
	    } else {
	        #"recursive was not null it was $recursive"
	    }
	
	    # $path = get-location
	    $path = (get-location | ForEach-Object { $_.ProviderPath })
	
	    $ErrorActionPreference = "SilentlyContinue"
	
	    get-childitem -Path * -Include $fileTypes -Exclude .git,.hg,*jquery*,modernizr* -Recurse:$recursive |
	        Where-Object { $_.DirectoryName -notmatch "_book" } |
	        select-string -pattern $pattern |
	        format-table -property @{Expression={$_.Path.SubString($path.Length+1)};Label="Location"},
	            @{Expression={$_.LineNumber};Label="Line"},
	            @{Expression={$_.Line.Replace("  "," ")};Label="Match"} -auto
	
	    return
	
	    trap {
	        write-host "Not a valid regex, so falling back to a simple match" -foregroundcolor  "green"
	
	        get-childitem -Path * -Include $fileTypes -Exclude .git,.hg,*jquery*,modernizr* -Recurse:$recursive |
	            Where-Object { $_.DirectoryName -notmatch "_book" } |
	            select-string -pattern $pattern -SimpleMatch |
	            Format-Table -property @{Expression={$_.Path.SubString($path.Length+1)};Label="Location"},
	                @{Expression={$_.LineNumber};Label="Line"},
	                @{Expression={$_.Line};Label="Match"} -auto
	    }
	}
	
	# same as findtext but does not use recursive
	function findtext_norecurse($pattern)
	{
	    findtext $pattern $false
	}
	
	# Pattern is not treated as regular expression -- it's a "simplematch" instead
	function findtext_raw($pattern, $recursive, $logging)
	{
	    if ($null -eq $pattern) {
	        write-host "Please provide a pattern you wish to find. (all text files will be searched)" -foregroundcolor  "red"
	        return
	    }
	
	    if ($null -eq $recursive) {
	        #"SETTING RECURSIVE"
	        $recursive = $true
	    } else {
	        #"recursive was not null it was $recursive"
	    }
	
	
	    $path = (get-location | ForEach-Object { $_.ProviderPath })
	
	    get-childitem -Path * -Include $fileTypes -Exclude .git,.hg,*jquery*,modernizr* -Recurse:$recursive |
	        Where-Object { $_.DirectoryName -notmatch "_book" } |
					% { 
							write-host $_.FullName -f yellow;
							$_ | select-string -pattern $pattern -SimpleMatch |
							Format-Table -property @{Expression={$_.Path.SubString($path.Length+1)};Label="Location"},
									@{Expression={$_.LineNumber};Label="Line"},
									@{Expression={$_.Line};Label="Match"} -auto;
						}
	}
	
	function findtext_raw_casesensitive($pattern, $recursive)
	{
	    if ($null -eq $pattern) {
	        write-host "Please provide a pattern you wish to find. (all text files will be searched)" -foregroundcolor  "red"
	        return
	    }
	
	    if ($null -eq $recursive) {
	        #"SETTING RECURSIVE"
	        $recursive = $true
	    } else {
	        #"recursive was not null it was $recursive"
	    }
	
	
	    $path = (get-location | ForEach-Object { $_.ProviderPath })
	
	    get-childitem -Path * -Include $fileTypes -Exclude .git,.hg,*jquery*,modernizr* -Recurse:$recursive |
	        Where-Object { $_.DirectoryName -notmatch "_book" } |
	        select-string -pattern $pattern -SimpleMatch -CaseSensitive |
	        Format-Table -property @{Expression={$_.Path.SubString($path.Length+1)};Label="Location"},
	            @{Expression={$_.LineNumber};Label="Line"},
	            @{Expression={$_.Line};Label="Match"} -auto
	}
	
	
	function findtext_raw_type($types, $pattern, $recursive){
		$originalTypes = $fileTypes;
		$fileTypes = $types;
		$logging = $true;
		findtext_raw $pattern $recursive $logging;
		$fileTypes = $originalTypes;
	}
	
	
	function findtext_type($types, $pattern, $recursive){
	
		$originalTypes = $fileTypes;
		$fileTypes = $types;
		findtext $pattern $recursive;
		$fileTypes = $originalTypes;
	}
	
	function findtext_help () {
	 
	
	}
	
	set-alias fi FindText # can't use "ft", it's "format-table" already
	set-alias f findtext
	set-alias f.raw findtext_raw
	set-alias f.type findtext_type
	set-alias f.type-raw findtext_raw_type
	set-alias f.raw-type findtext_raw_type
	set-alias f.raw-ci findtext_raw_casesensitive
	set-alias f.no-rec findtext_norecurse
