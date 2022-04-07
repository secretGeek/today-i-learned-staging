# kv favorites

I use `kv` - key value store tool - to hold some favorite little scraps of common scripts and queries.


## Summary of current folder

Summary of content of current folder. 

Shows the file types, number and size of files, and more.


	$xxxx =  @"
	Get-ChildItem -rec -file |
	Where-Object { -not (`$_.FullName -like '*\node_modules\*' -or
	`$_.FullName -like '*\obj\*' -or
	`$_.FullName -like '*\.git\*' -or
	`$_.FullName -like '*\.vs\*' -or
	`$_.FullName -like '*\.vscode\*' -or
	`$_.FullName -like '*\packages\*' -or
	`$_.FullName -like '*\.nuget\*') } |
	group-object -property { (`$_.extension) } |
	ForEach-Object {
	[PSCustomObject]@{
	Ext = `$_.Name
	Size_b = (`$_.Group.Length | Measure-Object -sum).Sum
	Count = `$_.Count
	Folders = (`$_.Group | % {`$_.Directory.FullName} | get-unique | count )
	Distinct_FileNames = (`$_.Group | % Name | get-unique | count )
	Files = (`$_.Group | % Name)
	}
	} | Sort-Object -desc Count, size_b | format-table
	"@

	kv summary $xxxx

## Html/Javascript Starter

    $value = @"
    <!DOCTYPE html>
    <html>
    <style>
    html,body, textarea{ width:100%; height: 100%}
    </style>
    <script type='text/javascript'>

    function go() {
      var v = `$('#x')[0].value;
      `$('#x')[0].value = 'ABC';
      alert(v);
    }

    function `$(selectors) {
      return document.querySelectorAll(selectors)
    }

    function jalert(o) {
      // never do this ;)
      alert(JSON.stringify(o, null, '\t'));
    }
    </script>
    <body>
    <input type='button' value=GO onclick='go();' />
    <textarea id='x'>
    abc
    </textarea>
    </body>
    </html>
    "@

    kv js $value


## Html Starter

	$value = @"
	<!DOCTYPE html>
	<html>
			<head>
					<meta charset='utf-8' name='viewport' content='width=device-width, initial-scale=1.0'>
					<title>   $$title   </title>
					<script type='text/javascript' src='/script.js' defer></script>
					<link rel='icon' href='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>????</text></svg>'>
					<link rel='stylesheet' type='text/css' href='/style.css'>
			</head>
	  <style>
	  /* via: https://jrl.ninja/etc/1/ */
			body {
			  max-width:70ch;
			  padding:2ch;
			  margin:auto;
			  color: #eee;
			  background: #333;
			  font-size:1.2em;
			  outline:1px solid black;
			  box-shadow:0 0 20px rgba(0,0,0,0.4);
			}
			pre {
			  white-space:pre-wrap;
			}
	  </style>
	  <body>
			<header></header>
			<article>

			<h1>TITLE</h1>
			<p>para</p>
			<blockquote>b</blockquote>


			</article>
			<footer></footer>
	  </body>
	  <script>
	  </script>
	</html>
	"@
	
	kv js $value

