# Find all the TODO's in a file or folder

	function todo()
	{
		# recursively search for TODO followed by colon, or [ ] with an underscore in between.
		findtext ("TODO" + ":|\[_\]")
	}

...which relies on my ever-evolving sense of 'findtext'

Currently something like.... (this is dynamically loaded from util)

	[string[]] $fileTypes = "*.md", "*.fmw", "*.txt", "*.cs", "*.cshtml", "*.css", "*.ps1", "*.js", "*.bat", "*.vbs", "*.vb", "*.xml", "*.config", "*.htm", "*.html", "*.pre", "*.ini", "*.sql", "*.linq", "*.json", "*.spark", "*.ts", "*.psm1", "*.psd1", "*.aspx", "*.ascx", "*.asp", "*.asmx", "*.pubxml", "*.dgml", "*.sln", "*.*proj", "*.spark", "*.rdl", "*.py", "*.log", "*.las", "*.ascx", "*.inc", "*.xaml",	"*.sh", "*.csv", "*.tsv", "*.php", "*.ok", "*.tsx", "*.targets", "*.yml", "*.rdp", "*.less", "*.scss", "*.razor","*.dbml","*.layout", "*.gradle", "*.properties";
	
	
	
	
	## Commands:
	## findtext $pattern                       <-- search all text type files for a particular regex
	###                                             if the pattern is not valid as a regex we'll treat it as a literal string.
	###                                             The complete list of filetypes is in this variable: $fileTypes
	## findtext_raw $pattern                   <-- search all text type files for a literal string.
	## findtext_type $types $pattern $recurse  <-- e.g. findtext_type "*.tsx" "import"
	## findtext_raw_type $pattern              <-- search all text type files for a literal string.
	## findtext_raw_casesensitive $pattern     <-- enforce case sensitivity!
	## findtext_norecurse                      <-- findtext but avoid recursing into child folders
	###                                             same as:   `format-findtext $pattern $false`
	## findtext_help                           <-- help on findtext and related commands
	## findtext_help_detailed                  <-- verbose help on findtext, with details.
	### find-text ($pattern, $recursive, $basePath, $Raw, $CaseSensitive)
	### format-findtext ($pattern, $recursive, $raw, $CaseSensitive)
	###                                         <-- (aliased as findtext) sends find-text to format-foundtext
	### format-foundtext ($result, $raw, $caseSensitive)
	
	function find-text {
	<#
	.SYNOPSIS
	    Looks for regex or (if $raw -eq $true) literal text patterns in all text files (but ignores `node_modules` folders, yay)
	.DESCRIPTION
		Ever need to find some text, or perhaps a regex, in every text file under the current location, and want to skip any node_modules folders (and any .git folders) -- looking *only* in "text" files, such as all code and config files? Find-Text is your friend.
	.NOTES
	    Author: Leon Bambrick
	#>
		Param (
			# A regular expression or a literal string you wish to find in any text file
			[ValidateNotNullOrEmpty()]
			[String]
			$Pattern, 
			[Bool]
			# search all subfolders as well (defaults to $true)
			$Recursive = $true,
			[String]
			# the folder from which the command is executed (used for displaying shorter paths)
			$BasePath = (get-location | ForEach-Object { $_.ProviderPath }),
			[Bool]
			# $true to search for literal pattern, $false (the default) to search for regular expressions
			$Raw = $false,
			[Bool]
			$CaseSensitive = $false
		)
	
	    get-childitem -Path * -Include $fileTypes -Exclude .git, .hg, *jquery*, modernizr* -Recurse:$Recursive |
			Where-Object { $_.FullName -inotmatch 'node_modules' } |
				select-string -pattern $pattern -SimpleMatch:$Raw -CaseSensitive:$CaseSensitive |
					ForEach-Object {
						Add-Member -inputObject $_ -memberType NoteProperty -name "RelativeName" -value ($_.Path.SubString($basePath.Length + 1));
						$_;
					}
	}
	
	# 
	# NOTE: the alias FINDTEXT points here!
	#
	function format-findtext($pattern, $recursive, $raw, $CaseSensitive) {
	    if ($null -eq $pattern) {
	        write-host "Please provide a Pattern you wish to find (all text files will be searched)" -foregroundcolor  "red"
	        return
	    }
	
	    if ($null -eq $recursive) {
	        #"SETTING RECURSIVE"
	        $recursive = $true
	    }
	    else {
	        #"recursive was not null it was $recursive"
	    }
	
	    if ($null -eq $raw) {
	        # RAW (meaning, simple match, not regex match) defaults to FALSE
	        $raw = $false;
	    }
	
	    if ($null -eq $CaseSensitive) {
	        # 'CaseSensitive' defaults to FALSE
	        $CaseSensitive = $false;
	    }
	
	    $basePath = (get-location | ForEach-Object { $_.ProviderPath })
	
	    # write-host $pattern -f magenta
	    # write-host $recursive -f magenta
	    # write-host $raw -f magenta
	    # write-host $CaseSensitive -f magenta
	
	    try {
	        return (find-text  $pattern  $recursive $basePath $raw $caseSensitive |
	            ForEach-Object {
	                format-foundtext $_ $raw $caseSensitive;
	            } );
	    }
	    catch {
	        write-host $_ -f darkred;
					if ($_.FullyQualifiedErrorId -eq "InvalidRegex,Microsoft.PowerShell.Commands.SelectStringCommand") {
						write-host "Falling back to a simple match..." -foregroundcolor  "green";
						format-findtext -pattern:$pattern -recursive:$recursive -raw:$true -casesensitive:$CaseSensitive
					}
	    }
	}
	
	function format-foundtextdimmed ($result, $len1, $raw, $caseSensitive) {
	    write-host "$($result.RelativeName.SubString(0, $len1))" -f darkblue -n;
	    write-host "$($result.RelativeName.SubString($len1)) " -f cyan -n;
	    write-host "$($result.LineNumber) " -f yellow -n;
	    Write-MarkedPatternInline ($result.Pattern) ($result.Line.Trim()) $raw $caseSensitive;
	    write-host "";
	}
	
	$script:previous = $null;
	
	
	
	function format-foundtext ($result, $raw, $caseSensitive) {
	    $dimLength = FindLongestCommonStartingSubString ($result.RelativeName) ($script:previous.RelativeName);
	    # specify what to break on... it returns how many parts in common.... or num chars.
	
	
		#format-foundtext-old $result $dimLength $raw $caseSensitive
	    format-foundtextdimmed $result $dimLength $raw $caseSensitive
	    $script:previous = $result;
	    $script:previousDimLength = $dimLength;
	}
	
	function format-foundtext-old ($result) {
	    write-host "$($result.RelativeName) " -f white -n;
	    write-host "$($result.LineNumber) " -f yellow -n;
	    Write-MarkedPatternInline ($result.Pattern) ($result.Line);
	    write-host "";
	}
	
	# same as findtext but does not use recursive
	function findtext_norecurse($pattern) {
	    format-findtext $pattern $false
	}
	
	# Pattern is not treated as regular expression -- it's a "simplematch" instead
	function findtext_raw($pattern, $recursive) {
	    return format-findtext $pattern $recursive $true;
	}
	
	function findtext_raw_casesensitive($pattern, $recursive, $raw) {
	    return format-findtext $pattern $recursive $raw $true;
	}
	
	function findtext_raw_type($types, $pattern, $recursive) {
	    $originalTypes = $fileTypes;
	    $fileTypes = $types;
	    findtext_raw $pattern $recursive;
	    $fileTypes = $originalTypes;
	}
	
	function findtext_type($types, $pattern, $recursive) {
	
	    $originalTypes = $fileTypes;
	    $fileTypes = $types;
	    format-findtext $pattern $recursive;
	    $fileTypes = $originalTypes;
	}
	
	function findtext_help () {
	    $x = (& { $myInvocation.ScriptName })
	    Get-Content $x | Where-Object { $_ -like "## *" } | ForEach-Object { $_.TrimStart("#") }
	}
	
	function findtext_help_detailed() {
		$x = (& { $myInvocation.ScriptName })
		Get-Content $x | Where-Object { ($_ -like "## *") -or ($_ -like "### *") } | ForEach-Object {
			Write-MarkedPatternInline "format|_|find|text|<--" ($_.TrimStart("#")) $false $false;
			write-host "";
		}
	}
	
	function FindLongestCommonStartingSubString($string1, $string2) {
	
	    $i = 0;
	    $max = 0;
	    do {
	        $string1.ToCharArray() | % {
	            if ($string2 -ne $null -and $i -le $string2.length -and $_ -eq $string2[$i]) {
	                $max = ($i + 1);
	            }
	            else { break; };
	            $i++;
	        }
	    } while ($false);
	
	    return $max;
	}
	
	function list-functions () {
	
	
	    #find-text "^\s*function( )" | % { New-Object psobject -property  @{
			find-text "^\s*function(.*)" $true ".\" $false $false| % { New-Object psobject -property  @{
	            FileName     = $_.FileName;
	            FunctionName = ($_.Line -split '[ (]')[1]
	        } } | ? { $_.FunctionName -ne '' }
	
	}
	
	set-alias findtext format-findtext
	set-alias fi format-findtext # can't use "ft", it's "format-table" already
	set-alias f format-findtext
	set-alias f.raw findtext_raw
	set-alias f.type findtext_type
	set-alias f.type-raw findtext_raw_type
	set-alias f.raw-type findtext_raw_type
	set-alias findtext_type_raw findtext_raw_type
	set-alias f.raw-ci findtext_raw_casesensitive
	set-alias f.no-rec findtext_norecurse
	set-alias ftx findtext_norecurse
