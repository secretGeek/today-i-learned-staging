# Nums Table in SQL Server - a table of numbers

For various purposes, it can be helpful to have a "nums" table in your SQL Server database. This is simply a table, with (for example) one column, called 'num', and perhpas `10,000` or `100,000` rows, simply containing the integers from `1` to `10,000` (or `100,000` as the case may be.)

One particular use for it is when you wish to aggregate (for example) the "Daily Sales Total" -- and you group sales values by the date, all seems good. But soon you realise there are some dates with no sales. You would like to have a value of "0" for those days, rather than just omit the row from your results.

So you will instead join first with a Common Table Expression of dates, that uses the `nums` table as its backbone --

	with Days as (
			select
			num,
			DateAdd(d, num*-1, DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0)) as [Date] from nums
			where num <= 31 and num > 1
		)

But to do this -- you must first create and populate your nums table.

There are many many different scripts for this, with various performance characteristics or limitations. 

Here is one -- it is based on "Method5" from [this excellent stack overflow answer](https://stackoverflow.com/a/1407488/49):



	-- DROP TABLE Nums
	CREATE TABLE Nums (Num  int  not null)  
	;WITH
		Pass0 as (select 1 as C union all select 1), --2 rows
		Pass1 as (select 1 as C from Pass0 as A, Pass0 as B),--4 rows
		Pass2 as (select 1 as C from Pass1 as A, Pass1 as B),--16 rows
		Pass3 as (select 1 as C from Pass2 as A, Pass2 as B),--256 rows
		Pass4 as (select 1 as C from Pass3 as A, Pass3 as B),--65536 rows
		--I removed Pass5, since I'm only populating the Nums table to 10,000
		Tally as (select row_number() over(order by C) as Num from Pass4)
	INSERT Nums
			(Num)
		SELECT Num
			FROM Tally
			WHERE Num <= 10000
	ALTER TABLE Nums ADD CONSTRAINT PK_Nums PRIMARY KEY CLUSTERED (Num)
		
	SELECT COUNT(*) as [Number of Numbers in Nums Table] FROM Nums


Mothers, tell your children, not to do what I have done, to spend your life, in sql misery, optimizing nums tables generation, for fun.

## References

- [sql server - What is the best way to create and populate a numbers table? - Stack Overflow](https://stackoverflow.com/questions/1393951/what-is-the-best-way-to-create-and-populate-a-numbers-table)
- [Why should I consider using an auxiliary numbers table?](https://web.archive.org/web/20150812093111/http://web.archive.org/web/20150411042510/http://sqlserver2000.databases.aspfaq.com/why-should-i-consider-using-an-auxiliary-numbers-table.html)

## See also

- [Pivot reports with dynamic pivoted columns (by day)](pivot.md)
