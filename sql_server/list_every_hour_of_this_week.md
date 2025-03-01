# List today and the last 7 days

# List from 11pm  tonight, the last 168 hours


	select DateAdd(Hour, -n, DateAdd(HOUR, 23, cast(CAST(GETDATE() AS DATE) as DateTime)))
	as [CountDown]
	FROM (SELECT TOP 168 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n 
		  FROM sys.all_objects) t



## Get the current date

       select GETDATE() as [GETDATE]


## Get the current Date as a Date

       select CAST(GETDATE() AS DATE) as [TODAY]

## Get the current Date as a DateTime

       select cast(CAST(GETDATE() AS DATE) as DateTime) as [TODAY]




## See also
