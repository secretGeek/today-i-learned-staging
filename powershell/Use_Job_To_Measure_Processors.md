# Use Job to measure Processors

(in Powershell)

## Checking CPU Percentage with Get-Counter (and a Job)

Checking the processor time or processor percentage, using counters or wmi...

	$JobObject = Start-Job -Name "MyJob" -ScriptBlock {
			Get-Counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 1 -Continuous
	}

	Start-Sleep -Seconds 5 # give it time to load
	$Result = Receive-Job -Job $JobObject

	$Result.Readings |
		Foreach-Object { ($_ -split ':')[-1].Trim() } |
		Measure-Object -Average |
		Select-Object @{n='Average';e={"{0:f2}" -f $_.Average}}

From [Retrieve average CPU-workload with Get-Counter](https://stackoverflow.com/questions/59051743/retrieve-average-cpu-workload-with-get-counter) (by Duke Donnovan and AdminOfThings)

## Checking CPU Percentage with WMI

	Get-WmiObject -computer $env:computername -class win32_processor |
		Measure-Object -property LoadPercentage -Average |
		Select-Object -ExpandProperty Average
