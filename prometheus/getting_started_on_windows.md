# Getting started with prometheus on windows

## Instrument a .net application

In any asp.net core application -- install these packages:

- prometheus-net
- prometheus-net.AspNetCore

In `Startup.cs` in Configure, add:

	app.UseMetricServer();

...which relies on `using Prometheus;`

Now run your application and visit "/metrics" -- you will see the default metrics that these packages are exporting, ready for Prometheus to collect.

e.g.

	# HELP process_working_set_bytes Process working set
	# TYPE process_working_set_bytes gauge
	process_working_set_bytes 85360640
	# HELP dotnet_total_memory_bytes Total known allocated memory
	# TYPE dotnet_total_memory_bytes gauge
	dotnet_total_memory_bytes 10217808
	# HELP process_virtual_memory_bytes Virtual memory size in bytes.
	# TYPE process_virtual_memory_bytes gauge
	process_virtual_memory_bytes 2223113158656
	# HELP process_num_threads Total number of threads
	# TYPE process_num_threads gauge
	process_num_threads 42
	# HELP process_cpu_seconds_total Total user and system CPU time spent in seconds.
	# TYPE process_cpu_seconds_total counter
	process_cpu_seconds_total 3.40625
	# HELP process_private_memory_bytes Process private memory size
	# TYPE process_private_memory_bytes gauge
	process_private_memory_bytes 94912512
	# HELP process_start_time_seconds Start time of the process since unix epoch in seconds.
	# TYPE process_start_time_seconds gauge
	process_start_time_seconds 1637826446.7683408
	# HELP process_open_handles Number of open handles
	# TYPE process_open_handles gauge
	process_open_handles 709
	# HELP dotnet_collection_count_total GC collection count
	# TYPE dotnet_collection_count_total counter
	dotnet_collection_count_total{generation="2"} 0
	dotnet_collection_count_total{generation="0"} 0
	dotnet_collection_count_total{generation="1"} 0

Note that each metric is like this:

	# HELP process_working_set_bytes Process working set
	# TYPE process_working_set_bytes gauge
	process_working_set_bytes 85360640

...two lines of comments, and then the metric itself.
The first comment line is `HELP`, followed by a space, followed by the name of the metric, followed by a space, then the rest of the line is a description.

The next comment line is `TYPE`, , followed by a space, followed by the name of the metric, followed by a space, followed by the type of metric... in the examples above we see two types: `counter` and `gauge`.

There are 4 types of metrics all up:

- Counters, e.g. process_cpu_seconds_total...
- Gauges
- Histograms
- Summaries

Quick descriptions:

- **Counters**, e.g. `process_cpu_seconds_total`, useful for things which never go backwards, always up. (In a car, the odometer would be am example of a counter, unlike other things on the dashboard...)
- **Gauges**, e.g. `process_num_threads`, useful for values that go up or down, such as amount of memory being used, number of threads. Similar to the gauges on the dashboard of a car such as RPM and speed.
- ** Summaries **, e.g. `request_duration`, shows summary information about a measure, with a specified "quantile". (A quantile is a general term, of which 'percentile' is an example... so a quantile of 0.95 is the same as saying 'the 95th percentile'). I probably need to expand this definition. A summary can include other aggregates such as count and sum.
- ** Histograms **, e.g.  `uploaded_image_bytes_bucket`, useful for values where you want to see a distribution broken into buckets. For example, length_of_journey broken into buckets of 10 kilometres, would tell you "How many journeys were from 0-9 kilometres? how many journeys were from 10-19 kilometres? etc." -- and this is more meaningful than "average journey length".

## Add a custom metric to our application

In the homeController of our asp.net core application (or any controller) -- add a field such as:

	private readonly Counter counter = Metrics.CreateCounter("my_counter", "index page counter");

...this again relies on `using Prometheus;`

and in the index action, add: `counter.Inc();`

Run the application and visit that page (the home/index page) a few times.

Now refresh the `/Metrics` endpoint and you will see three new lines, describing your new metric and its value.

i.e.

	# HELP my_counter index page counter
	# TYPE my_counter counter
	my_counter 7

You see the name and help description you specified in the field. The type is `counter`. And the value, 7, will increment each time the home page is visited.

When you restart the application, it will restart from 1 (the first time it is called.)

## Run prometheus on windows

- If you have a regular 64-bit Windows machine, go to [Download | Prometheus](https://prometheus.io/download/) and select the Operating System 'Windows' and the Architecture 'amd64'

Currently it's `prometheus-2.32.0-beta.0.windows-amd64.zip`.

Unzip and run that.

- [First steps | Prometheus](https://prometheus.io/docs/introduction/first_steps/)


## See also

- [Exporting Prometheus metrics in ASP.NET Core (2/5) - YouTube](https://www.youtube.com/watch?v=EAQOr8FAs44)
- [The 4 Types Of Prometheus Metrics - Tom Gregory](https://tomgregory.com/the-four-types-of-prometheus-metrics/)
- [Download | Prometheus](https://prometheus.io/download/)
- [First steps | Prometheus](https://prometheus.io/docs/introduction/first_steps/)