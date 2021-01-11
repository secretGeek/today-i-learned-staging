# Info Message: Processing Info returned from SQL (in C#)

Just want to take note of this for next time I need it:

When executing queries with SqlConnection and friends, you can add a handled for SqlInfoMessageEvents -- like so...


	var(SqlConnection conn = new SqlConnection(connectionString)) {
		conn.InfoMessage += new SqlInfoMessageEventHandler(conn_InfoMessage);
		conn.FireInfoMessageEventOnUserErrors = true;
		conn.Open();

....

where the message handler is, for example:


	static void conn_InfoMessage(object sender, SqlInfoMessageEventArgs e)
	{
			MessageBox.Show("InfoMessage Handled Error Level-" + 	e.Errors[0].Class.ToString() + ":" + e.Message);           
	}



...(and it may as well be done with a local/lambda function)



## Source

- [Using InfoMessage Event of SqlConnection Object](https://www.codeproject.com/Articles/37102/Using-InfoMessage-Event-of-SqlConnection-Object)