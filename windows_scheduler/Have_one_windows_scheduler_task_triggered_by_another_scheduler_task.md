# Have one windows scheduler task triggered by another scheduler task

In "Windows Scheduler" I've mostly seen it used for tasks that are either at recurring times or that happen upon startup.

Recently I wanted to have a new task, lets call it "Task2", that was triggered after "Task1" (where Task1 happens at 6am, 9am, 12pm, 3pm... of something like that.)

A scheduled task doesn't have to be triggered by a schedule -- there are a few other possibilities (but nothing as straight forward as picking a different task to be the trigger.)

Here is an an example of the eventlog entry written when Task1 is completed:

	<Event xmlns=http://schemas.microsoft.com/win/2004/08/events/event>
		<System>
			<Provider Name="Microsoft-Windows-TaskScheduler" Guid="{DE7B24EA-73C8-4A09-985D-5BDADCFA9017}" />
			<EventID>201</EventID>
			<Version>1</Version>
			<Level>4</Level>
			<Task>201</Task>    <-- this means "Action completed"
			<Opcode>2</Opcode>
			<Keywords>0x8000000000000000</Keywords>
			<TimeCreated SystemTime="2022-01-17T08:09:07.582178900Z" />
			<EventRecordID>16802453</EventRecordID>
			<Correlation ActivityID="{01732E2D-2F44-49C6-BEBB-7F1992BEA54E}" />
			<Execution ProcessID="3632" ThreadID="8656" />
			<Channel>Microsoft-Windows-TaskScheduler/Operational</Channel>
			<Computer>Computer1.example.com</Computer>
			<Security UserID="S-1-5-21-256891309-1783273047-2954831641-19900" />
		</System>
		<EventData Name="ActionSuccess">
			<Data Name="TaskName">\Task1</Data>     <-- The task we're interested in
			<Data Name="TaskInstanceId">{01742E2D-2F44-49B6-BEEB-77347734A54E}</Data>
			<Data Name="ActionName">C:\Windows\SYSTEM32\cmd.exe</Data>
			<Data Name="ResultCode">0</Data>    <--  "0" means the task succeeded
		</EventData>
	</Event>

And now the custom trigger has to have a piece of XSLT which will find events like this one.


	<Select Path="Microsoft-Windows-TaskScheduler/Operational">
	*[System[(Level=4 or Level=0) and (EventID=201)]]
	and
	*[EventData[Data[@Name='TaskName'] and Data='\Task1']]
	</Select>

<!--

## Source(s)

- [ ] add sources

-->
