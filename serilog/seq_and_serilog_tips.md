# Tips for QUERYING Seq (Structured Exception Queries)


## Grouped up exception by EventType


	select count(*) as Occurrences,
		   ( sum(Length(@Document)) / count(@Id)  )  as AverageCh,
		   first(@MessageTemplate) as MessageTemplate,
		   ToHexString(first(@EventType)) as EventType,
		   ToIsoString(Min(@Timestamp)) as MinTime,
		   ToIsoString(Max(@Timestamp)) as MaxTime
	from stream
	where ApplicationName not in  ['SomeOtherApplication1','SomeOtherApplication2']
	and
		Not(   @Level = 'Verbose'
			or @Level = 'Trace'
			or @Level = 'Debug'
			or @Level = 'Information'
			or @Level like 'INFO'
			or @Level = 'Warning'
			or @Level like 'WARN')
	and (@EventType <> 123456789)
	group by ApplicationName, @EventType
	order by Occurrences desc, AverageCh desc
	limit 30


To focus on a given row from the above result set, you would then change the query to just be the EventType value:

	@EventType = 888888888



When you group by @EventType it shows the value in base 10 (decimal). But when you view an ordinary Seq trace, the @EventType is shown in Hex.

You can show the Hex representation by using the ToHexString function. And you can write the number in either hex, with 0xprefix, or in decimal.

Here is an example of using either form for a comparison, and showing the result in both hex and decimal


	Select count(*) from stream
	where
	   @EventType = 0x34fb5e38
	or @EventType = 888888888
	group by
	   @EventType,
	   ToHexString(@EventType)

Incidentally if I need to quickly turn a decimal into hex, with leading `0x`, I use powershell, e.g.

	'0x{0:x}' -f 888888888


(The result is `0x34fb5e38`)

...and reverse this with:

	[Int64]"0x34fb5e38"

(The result is `888888888`)


You can also find an EventType value from a template string (`@MessageTemplate`)--

    @EventType = ToEventType('Logged in {UserId}')



## How to perform Count Distinct with SEQ

When grouping/aggregating in SQL I love to use:

	Select
		Count(distinct SomeColumn) as CountDistinct,
		Count(*) as TotalCount
	from SomeTable
	group by count(distinct SomeColumn)

...with Seq the syntax is `Count(Distinct(SomeColumnName))`

e.g, errors that effect more than 30 users....


    select count(distinct(UserName)) as CountDistinct
	from stream
	where @Level = 'Error'
	group by @MessageTemplate
	having CountDistinct > 30
	order by CountDistinct desc


...You can plug the relevant @MessageTemplate value into this query (for example)

	@EventType = ToEventType('Unhandled exception when retrieving {PizzaType}')



## Overview of tips


- overly generic naming of a property
- inconsistent name of a property
- case insensitive naming of a property
- using $"interpolated {strings}" prevents serilog doing "proper {structured}", logging
- suggest enriching a context if multiple log events will be recorded -- and helping correlation anyway you can -- 
- Error(ex.Message, ex) versus -- Error(ex, "Description here")
- lack of "environment" / "machine" / "applicationName" properties
	- inconsistent or slightly different variants on those... "EnvironmentName", "MachineName" etc -- ruins grouping.
- any and all string concatentation  ruins the message template pattern
- putting `@` before a property, when it is not a good idea to do so .... and the times when it is a good idea (simple arrays).