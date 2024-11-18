# Trim or zero-out a portion of a datetime

To trim off the milliseconds... (this was necessary when sending to XML for consumption by Excel...)

    DATEADD(ms, -DATEPART(ms, YourDate), YourDate)

To trim off the entire time portion....
i.e. want just the date portion of a datetime? (dateonly)

    DATEADD(dd, 0, DATEDIFF(dd, 0, YourDate))

A function to do it for you....

    CREATE FUNCTION dbo.JustDate(@date DATETIME)
    RETURNS DATETIME
    AS
    BEGIN
          RETURN DATEADD(dd, 0, DATEDIFF(dd, 0, @date))
    END


## Today in SQL (with no time component) 

You can use the above to return "today" without a time component:

	DATEADD(dd, 0, DATEDIFF(dd, 0, GetDate()))
	

## Yesterday in SQL (with no time component) 

Or Yesterday

	
	DATEADD(dd, 0, DATEDIFF(dd, 0, GetDate()))


## See also

 - [First (and last) day of the month.](first_day_of_month.md)