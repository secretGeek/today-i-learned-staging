get-content .\roughnotes1.txt.ps1 |
	foreach {
		if ($_ -like 'FILE:*') {
			# Set the filename based on the token
			$file = ($_ -split ':')[1].Trim();
			# (consider: delete the file at this point, if it already exists)
			if (test-path $file) {del $file}
		} else {
			# Append to the file. Assumes we've already set a filename
			$_ |
				out-FileUtf8NoBom -append $file
		}
	}