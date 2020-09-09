# An issue with Powershell Tokenize

I am trying to use `[System.Management.Automation.PSParser]::Tokenize` to syntax highlight some code.

But I have a problem!


First a simple case (that works ok)

Consider this line of code:

	echo "hello"

What tokens does it have? We can find out like this:

	[System.Management.Automation.PSParser]::Tokenize('echo "hello"', [ref]$null) | Format-Table;

...which produces this table.

	Content    Type Start Length StartLine StartColumn EndLine EndColumn
	-------    ---- ----- ------ --------- ----------- ------- ---------
	echo    Command     0      4         1           1       1         5
	hello    String     5      7         1           6       1        13



That's awesome. It is the `Command` `echo` followed by the `String` `hello`.

But I am confused by the next example.

Consider these two lines of code:


	echo "$hello"; echo '$hello'
	

These are similar but *different*. 

They are both 'echo' Command followed by a String. But the `$hello` is very different between the two examples.

- In the first line, the `$hello` is a variable inside the string, and it will be interpolated.
- In the second line, the `$hello` is a literal string: it is not interpolated.

If you paste those two lines into a Powershell console you'll see that the `$hello` is syntax highlighted differently in each case.

![echo hello echo hello](echo_hello_echo_hello.png)

Now look at what happens when we tokenize them...

	[System.Management.Automation.PSParser]::Tokenize('echo "$hello"', [ref]$null) | Format-Table;
	[System.Management.Automation.PSParser]::Tokenize("echo '`$hello'", [ref]$null) | Format-Table;

They both produce the same tokens, with the same content.

	Content    Type Start Length StartLine StartColumn EndLine EndColumn
	-------    ---- ----- ------ --------- ----------- ------- ---------
	echo    Command     0      4         1           1       1         5
	$hello   String     5      8         1           6       1        14


If we try to write our own syntax highlighter, how do we know to highlight the two strings differently?











