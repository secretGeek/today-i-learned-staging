# Relative Dates

This is a function that gives a whole bunch of day functions, relative to any given DateTime

- *Now*
- *Today*
- *Yesterday*
- *Tomorrow*
- *A week Today*
- *Monday of this week*
- *Monday of last week*
- *Monday Fortnight* - (Although not commonly used in the American English, a "**fortnight**" is a two-week period, and is used in other variants of English) 
- ...and so on for the other days of the week.


The function itself


	CREATE FUNCTION dbo.[DaysRelative]
	(	
		-- Add the parameters for the function here
		@BaseTime DateTime
	)
	RETURNS TABLE 
	AS
	RETURN 
	(
	-- Declare @BaseTime DateTime = DateAdd(d, 0, GetDate());

	Select
		-- Basic date terms
		@BaseTime as [Now],	
		Cast(Cast(@BaseTime as Date) as DateTime) as [Today],
		Cast(DateAdd(d, -1, Cast(@BaseTime as Date)) as DateTime) as [Yesterday],
		Cast(DateAdd(d, 1,	Cast(@BaseTime as Date)) as DateTime) as [Tomorrow],
		DateAdd(d, 7, 		Cast(Cast(@BaseTime as Date) as DateTime)) as [A_Week_Today],
		DateAdd(d, 14, 		Cast(Cast(@BaseTime as Date) as DateTime)) as [A_Fortnight_Today],
		DateAdd(d, -7, 		Cast(Cast(@BaseTime as Date) as DateTime)) as [A_Week_Ago],
		DateAdd(d, -14, 	Cast(Cast(@BaseTime as Date) as DateTime)) as [A_Fortnight_Ago],
		-- Mondays
		DateAdd(day, 1, 	DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Monday_of_this_week_,
		DateAdd(day, 1+7, 	DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Monday_of_next_week_,
		DateAdd(day, 1+14, 	DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Monday_Fortnight_,
		-- This week
		DateAdd(day, 1, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Monday_of_this_week,
		DateAdd(day, 2, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Tuesday_of_this_week,
		DateAdd(day, 3, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Wednesday_of_this_week,
		DateAdd(day, 4, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Thursday_of_this_week,
		DateAdd(day, 5, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Friday_of_this_week,
		DateAdd(day, 6, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Saturday_of_this_week,
		DateAdd(day, 7, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Sunday_of_this_week,
		-- Next week
		DateAdd(day, 1+7, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Monday_of_next_week,
		DateAdd(day, 2+7, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Tuesday_of_next_week,
		DateAdd(day, 3+7, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Wednesday_of_next_week,
		DateAdd(day, 4+7, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Thursday_of_next_week,
		DateAdd(day, 5+7, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Friday_of_next_week,
		DateAdd(day, 6+7, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Saturday_of_next_week,
		DateAdd(day, 7+7, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Sunday_of_next_week,
		-- Fortnight
		DateAdd(day, 1+14, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Monday_Fortnight,
		DateAdd(day, 2+14, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Tuesday_Fortnight,
		DateAdd(day, 3+14, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Wednesday_Fortnight,
		DateAdd(day, 4+14, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Thursday_Fortnight,
		DateAdd(day, 5+14, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Friday_Fortnight,
		DateAdd(day, 6+14, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Saturday_Fortnight,
		DateAdd(day, 7+14, DATEADD(wk, DATEDIFF(wk, 6, @BaseTime), 6)) as Sunday_Fortnight
	)

## Columns / Results

Given any base date (such as, the day after tomorrow), it will tell you, relative to that date when is:

- `Now` - Now
- `Today` - Today
- `Yesterday` - Yesterday
- `Tomorrow` - Tomorrow
- `Monday_of_this_week` - Monday of this week
- `Monday_of_next_week` - Monday of next week
- `Monday_Fortnight` - Monday Fortnight
- `Tuesday_of_this_week` - Tuesday of this week
- `Wednesday_of_this_week` - Wednesday of this week
- `Thursday_of_this_week` - Thursday of this week
- `Friday_of_this_week` - Friday of this week
- `Saturday_of_this_week` - Saturday of this week
- `Sunday_of_this_week` - Sunday of this week
- `Tuesday_of_next_week` - Tuesday of next week
- `Wednesday_of_next_week` - Wednesday of next week
- `Thursday_of_next_week` - Thursday of next week
- `Friday_of_next_week` - Friday of next week
- `Saturday_of_next_week` - Saturday of next week
- `Sunday_of_next_week` - Sunday of next week
- `Wednesday_Fortnight` - Wednesday Fortnight
- `Thursday_Fortnight` - Thursday Fortnight
- `Friday_Fortnight` - Friday Fortnight
- `Saturday_Fortnight` - Saturday Fortnight
- `Sunday_Fortnight` - Sunday Fortnight


## See also

- [Trim or zero-out a portion of a datetime](datetime_trim_hours_milliseconds.md)
- [Format DateTime as yyyy-MM-dd](format_datetime_yyyy-MM-dd.md)
- [Parse varchar into DateTime](parse_varchar_into_datetime.md)