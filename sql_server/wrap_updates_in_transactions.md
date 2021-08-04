# Wrap an update in a transaction with this script template...

You want to make an update, manually perhaps... but you don't want to commit it if anything looks... wrong...


	Declare @RowsAffected integer
	Declare @ExpectedRows integer

	BEGIN TRANSACTION;
	SET @ExpectedRows = -1;  -- SET the *expected* number of affected rows here
	---BEGIN UPDATE:
	
	/*  YOUR UPDATE HERE... */

	---...END UPDATE.
	SET @RowsAffected = @@ROWCOUNT

	Print 'Rows affected: '
	Print @Rowsaffected

	IF @RowsAffected != @ExpectedRows
	BEGIN
		Print 'UNSAFE NUMBER OF ROWS. ROLLING BACK!'
		ROLLBACK;
	END
	ELSE
	BEGIN
		Print 'Ok. Commiting'
		COMMIT;
	END



For example...

let's create a little example table...


	Select 'x' as 't' into t1

Now we want to run an update against this table... we will expect 1 row to be updated. If any other number of rows are updated, the transaction will be rolled back.


	Declare @RowsAffected integer
	Declare @ExpectedRows integer

	BEGIN TRANSACTION;
	SET @ExpectedRows = 1;  -- WE HAVE SET THE *expected* Rows to 1
	---BEGIN UPDATE:
	
					Update t1 
					set t = 'a'

	---...END UPDATE.
	SET @RowsAffected = @@ROWCOUNT

	Print 'Rows affected: '
	Print @Rowsaffected

	IF @RowsAffected != @ExpectedRows
	BEGIN
		Print 'UNSAFE NUMBER OF ROWS. ROLLING BACK!'
		ROLLBACK;
	END
	ELSE
	BEGIN
		Print 'Ok. Commiting'
		COMMIT;
	END
