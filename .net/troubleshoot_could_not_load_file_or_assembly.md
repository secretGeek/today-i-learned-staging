# Troubleshooting File Not Found Exception" - "Could not load file or assembly"

I'm experiencing this on Ubuntu, using .net 6, trying to use SQLite.

This same application was talking to SQLite just fine yesterday - but now:

	"System.IO.FileNotFoundException: Could not load file or assembly 'Microsoft.Data.Sqlite, Version=7.0.5.0, Culture=neutral, PublicKeyToken=adb9793829ddae60'. The system cannot find the file specified."

The file "Microsoft.Data.Sqlite" is *right there* in the same folder as the binary.

On windows, to really deeply troubleshoot this we used to use `fuslogvw` (fusion log viewer) -- and another technique was to overload the Asemlby Load method and log what it's doing when it fails.

On ubuntu... I don't know what to do! -- but some research has shown me the way!

There is a tool called `dotnet-trace` -- hence this is a guide to:

## Troubleshooting File Not Found Exception" - "Could not load file or assembly" with dotnet-trace


### 1. install dotnet-trace

Install `dotnet-trace` on the machine where the app is failing.

Like so:

	dotnet tool install --global dotnet-trace


The last part of the output from this:

	You can invoke the tool using the following command: dotnet-trace
	Tool 'dotnet-trace' (version '7.0.421201') was successfully installed.


Now -- the basic process is:

1. Run your application (the one that experiences the problem)
2. Find out its process id
3. Tell `dotnet-trace` to trace that process id, and capture events related to assembly loading
4. Stop `dotnet-trace`
5. Find the file it has created
6. Import that file onto your windows machine and inspect it there (using visual studio)

(There's other ways you can do those last steps -- you could convert it to a different format on linux (`speedscope`) and inspect it right there on linux... or bring it to Windows/Mac and use tools other than Visual Studio to do the analysis.)


### 1. Run your application (the one that experiences the problem)

In my case the application is always running, supervisor takes care of that.

Otherwise -- run it from the console. And then leave that console open. From a different console, you will do the next steps:

### 2. Find out its process id

This is something I often have to do anyway... I use "ps x | grep STRING" where string is a part of the name of the application.

e.g.  

    ps x | grep dot

Shows me all running apps whose commandline include "dotnet"

Once of those is my target app -- 

	1751 ?        SLl    0:07 /usr/bin/dotnet /opt/webapps/mywebapp/app/myapp.dll


### 3. Tell `dotnet-trace` to trace that process id, and capture events related to assembly loading


Now we know the process id is `1751` -- we run `dotnet-trace` and give it that proess id.

We also tell it which events to capture (I'll explain in a minute)

	dotnet-trace collect --providers Microsoft-Windows-DotNETRuntime:4:4 --process-id 1751        


The provider `Microsoft-Windows-DotNETRuntime` is relevant for all the assembly load / fail events.

The 4:4 .... the first 4 refers to which items from this list:
Microsoft-Windows-DotNETRuntime:4:4

| Keyword String Alias | Keyword Hex Value |
|----------------------|-------------------|
| gc | 0x1 |
| gchandle | 0x2 |
| fusion | 0x4 |
| loader | 0x8 |
| jit | 0x10 |
| ngen | 0x20 |
| startenumeration | 0x40 |
| endenumeration | 0x80 |
| security | 0x400 |
| appdomainresourcemanagement | 0x800 |
| jittracing | 0x1000 |
| interop | 0x2000 |
| contention | 0x4000 |
| exception | 0x8000 |
| threading | 0x10000 |
| jittedmethodiltonativemap | 0x20000 |
| overrideandsuppressngenevents | 0x40000 |
| type | 0x80000 |
| gcheapdump | 0x100000 |
| gcsampledobjectallocationhigh | 0x200000 |
| gcheapsurvivalandmovement | 0x400000 |
| gcheapcollect | 0x800000 |
| gcheapandtypenames | 0x1000000 |
| gcsampledobjectallocationlow | 0x2000000 |
| perftrack | 0x20000000 |
| stack | 0x40000000 |
| threadtransfer | 0x80000000 |
| debugger | 0x100000000 |
| monitoring | 0x200000000 |
| codesymbols | 0x400000000 |
| eventsource | 0x800000000 |
| compilation | 0x1000000000 |
| compilationdiagnostic | 0x2000000000 |
| methoddiagnostic | 0x4000000000 |
| typediagnostic | 0x8000000000 |

...we are after "fusion" -- so we want "4".  If we wanted fusion(4) plus GC (1) then we'd give the value "5".

What about the second numbr?

I said to use:

	"Microsoft-Windows-DotNETRuntime:4:4"

The first 4 was 'fusion' - the second number is the `clreventlevel` ([see](https://learn.microsoft.com/en-us/dotnet/api/system.diagnostics.tracing.eventlevel?view=net-7.0))

| Level | Meaning | Description |
|-------|---------|-------------|
| 1 | Critical |  This level corresponds to a critical error, which is a serious error that has caused a major failure. | 
| 2 | Error |  This level adds standard errors that signify a problem. | 
| 4 | Informational |  This level adds informational events or messages that are not errors. These events can help trace the progress or state of an application. | 
| 0 | LogAlways |  No level filtering is done on the event. When used as a level filter for enabling events, for example in EventListener.EnableEvents(), events of all levels will be included. | 
| 5 | Verbose |  This level adds lengthy events or messages. It causes all events to be logged. | 
| 3 | Warning |  This level adds warning events (for example, events that are published because a disk is nearing full capacity). | 

Now that it's running, do whatever is needed to "cause" the File Not Found error you want to debug.

### 4. Stop `dotnet-trace`

Stop dotnet-trace with Ctrl-C.

### 5. Find the file it has created

You will see that it has written a `*.nettrace` file in your `home/user` (`~`) folder -- it will tell you the exact name in its output.

### 6. Import that file onto your windows machine and inspect it there (using visual studio)

Copy that `*.nettrace` file onto your windows machine.

Open it with visual studio --- sometimes this fails. I found I needed a "clean" instance of visual studio.

First it converts the file into a `*.nettrace.etlx` file.

Now look at what the events says.

Look really hard.

Look until the beads of blood begin to pool on your forehead.

This is where I ran out of luck atm. 

But tomorrow brings fresh hope.
	

## Other thoughts


From "[How the runtime locates assemblies](https://learn.microsoft.com/en-us/dotnet/framework/deployment/how-the-runtime-locates-assemblies)"


> 1. Determines the correct assembly version by examining applicable configuration files, including the application configuration file, publisher policy file, and machine configuration file. If the configuration file is located on a remote machine, the runtime must locate and download the application configuration file first.
> 
> 2. Checks whether the assembly name has been bound to before and, if so, uses the previously loaded assembly. If a previous request to load the assembly failed, the request is failed immediately without attempting to load the assembly.
> 
> Note - The caching of assembly binding failures is new in .NET Framework version 2.0.
> 
> 3. Checks the global assembly cache. If the assembly is found there, the runtime uses this assembly.
> 
> 4. Probes for the assembly using the following steps:
> 
>   a. If configuration and publisher policy do not affect the original reference and if the bind request was created using the Assembly.LoadFrom method, the runtime checks for location hints.
> 
>   b. If a codebase is found in the configuration files, the runtime checks only this location. If this probe fails, the runtime determines that the binding request failed and no other probing occurs.
> 
>   c. Probes for the assembly using the heuristics described in the probing section. If the assembly is not found after probing, the runtime requests the Windows Installer to provide the assembly. This acts as an install-on-demand feature.
> 
>  Note: There is no version checking for assemblies without strong names, nor does the runtime check in the global assembly cache for assemblies without strong names.


Note this -- 

"If a codebase is found in the configuration files, the runtime checks only this location. If this probe fails, the runtime determines that the binding request failed and no other probing occurs."

codebase is an element, as in `<codebase>...</codebase>`.

Note that assembly binding failures are cached, not repeated.

Hence you may fail to capture the failure, if its not performed.

> To revert to the behavior of the .NET Framework versions 1.0 and 1.1, which did not cache binding failures, include the <disableCachingBindingFailures> Element in your configuration file.

How is probing performed:

> 1. Application base, which is the root location where the application is being executed.
> 
> 2. Culture, which is the culture attribute of the assembly being referenced.
> 
> 3. Name, which is the name of the referenced assembly.
> 
> 4. The privatePath attribute of the <probing> element, which is the user-defined list of subdirectories under the root location. This location can be specified in the application configuration file and in managed code using the AppDomainSetup.PrivateBinPath property for an application domain. When specified in managed code, the managed code privatePath is probed first, followed by the path specified in the application configuration file.





## Sources

- [dotnet-trace performance analysis utility](https://learn.microsoft.com/en-gb/dotnet/core/diagnostics/dotnet-trace)
  - [View the trace captured from dotnet-trace](https://learn.microsoft.com/en-gb/dotnet/core/diagnostics/dotnet-trace#view-the-trace-captured-from-dotnet-trace)
- [tracing event levels](https://learn.microsoft.com/en-us/dotnet/api/system.diagnostics.tracing.eventlevel?view=net-7.0)
- [.NET runtime events](https://learn.microsoft.com/en-gb/dotnet/fundamentals/diagnostics/runtime-events)
- [Loader and binder runtime events - .NET | Microsoft Learn](https://learn.microsoft.com/en-gb/dotnet/fundamentals/diagnostics/runtime-loader-binder-events)
- [How the runtime locates assemblies](https://learn.microsoft.com/en-us/dotnet/framework/deployment/how-the-runtime-locates-assemblies)

## See also

- [Asp.net MVC 3.0.0.0 upgrade to Asp.net MVC 3.0.0.1](../asp.net_mvc/asp_net_mvc_3_patch.md)
- [DataReader.GetFieldType returned null (for Geography)](../sql_spatial/getfieldtype_returned_null.md)

