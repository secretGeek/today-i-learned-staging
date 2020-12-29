# test with
# dir . *.md -rec | select -first 2 | % { get-title $_ }
function get-title($fileName) {

	if (test-path($fileName)) {
		$heading = (Select-String -Pattern "# " -Path $fileName -list -SimpleMatch | select-object -First 1 | % { $_.Line -replace "^# ", ""} );
		return $heading;
	}

	return $fileName.Name.replace(".md","").replace("_"," ");
}