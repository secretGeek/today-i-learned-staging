# List today and the last 7 days

## List from 11pm tonight, the last 168 hours

That is, if today is `tuesday`, list the `7*24` hours that started at the beginning of last `wednesday` (i.e. the week that ends tonight). This lists them in descending order.


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

- [Relative Dates](relative_dates.md)
- [Trim or zero-out a portion of a datetime](datetime_trim_hours_milliseconds.md)
- [Format DateTime as yyyy-MM-dd](format_datetime_yyyy-MM-dd.md)
- [Parse varchar into DateTime](parse_varchar_into_datetime.md)