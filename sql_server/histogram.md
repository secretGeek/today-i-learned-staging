# Example query for bucketing up a bunch of values in SQL Server

Example of sorting results into buckets (ranges), and showing the count in each bucket, as well as the average of some other column, for members in that bucket.

    declare @interval int = 5000 --bucket size
    Select
        --@interval * Floor(DirectDistance/@interval) as Min_,
        --@interval * Floor(DirectDistance/@interval) + @Interval - 1 as Max_,
        '' + Cast((@interval * Floor(DirectDistance/@interval)) as varchar(20))  + ' - ' +
            Cast((@interval * Floor(DirectDistance/@interval) + @Interval - 1) as varchar(20)) as 'Range',
        --Floor(DirectDistance/@interval) as Bucket,
        AVG(Metres_Per_Minute) as Avg_Metres_Per_Minute,
        COUNT(*) as Number_of_Examples
    from
        GIS.TravelTimeExamples
    group by
        Floor(DirectDistance/@interval)
    having COUNT(*) > 15
    order by
        Floor(DirectDistance/@interval)  --order by bucket



## More examples

Example -- with:

A table called 
- `TableOfInterest` -- any table we are interested in
- `MeasuredExpression` -- could be a numeric column from `TableOfInterest`, or a numeric expression using numeric columns from `TableOfInterest`

I.e. we could run:   `Select MeasuredExpression from TableOfInterest`

Find the min and max:

	Declare @maxValue int = null;
	Declare @minValue int = null;

	select
		@maxValue = max(MeasuredExpression),
		@minValue = min(MeasuredExpression)
	from dbo.TableOfInterest 

Decide how many 'buckets' you want to divide the area into.


	Declare @numBuckets int = 10;


Determine the size of the buckets.

	Declare @bucketSize int = null;

	Set @BucketSize =  (@Maxvalue - @MinValue) /  @numBuckets;


Review the settings now, before we fine tune them.

	Select 
		@MinValue as 'MinValue',
		@MaxValue as 'MaxValue',
		@BucketSize as 'BucketSize',
		'Before' as 'StateName';


### FINE TUNING....

Now we need to decide how we'd like to fine tune the region that we are graphing. Maybe we only want to go from 15 to 25?

	-- Fine tune the parameters to show different number of buckets in different size...
	Select 
		@MinValue = 5816,
		@MaxValue = 7283,

	-- recalculate bucketsize...
	Set @BucketSize =  (@Maxvalue - @MinValue) /  @numBuckets;


	Select 
		@MinValue as 'MinValue',
		@MaxValue as 'MaxValue',
		@BucketSize as 'BucketSize',
		'Adjusted' as 'StateName';


	Select
		--@BucketSize * Floor(MeasuredExpression/@BucketSize) as Min_,
		--@BucketSize * Floor(MeasuredExpression/@BucketSize) + @BucketSize - 1 as Max_,
		'' + Cast((@BucketSize * Floor((MeasuredExpression - @minValue)/@BucketSize)) as varchar(20))  + ' - ' +
			Cast((@BucketSize * Floor((MeasuredExpression - @minValue)/@BucketSize) + @BucketSize - 1) as varchar(20))
			as 'Range',
		--Floor(MeasuredExpression/@BucketSize) as Bucket,
		--AVG(Metres_Per_Minute) as Avg_Metres_Per_Minute,
		COUNT(*) as Number_of_Examples
	from
		dbo.TableOfInterest 
	group by
		Floor((MeasuredExpression - @minValue)/@BucketSize)
	having Min(MeasuredExpression) >= @minValue
	and Max(MeasuredExpression) <= @MaxValue
	--having COUNT(*) > 15
	order by
		Floor(MeasuredExpression - @minValue)/@BucketSize)  --order by bucket




## Include Eempty Buckets

Note: it's good to "cross join" with a nums table to show rows with zero counts as well!

Join with a nums table..





-----

## See also

- [Histograms in Powershell](../powershell/histogram)