# How to use SQL Server Management Studio (SSMS) to access Windows authenticated databases across a VPN

(*i.e. Remote SQL with SSMS on VPN*)

Imagine you're on a "work from home" computer, connected over a VPN to a client network (perhaps using a software or hardware token)

You open SSMS -- and can't see how to connect via "Windows Authentication" to a machine on that network.

The trick is to launch `SSMS.exe` with runas, specifying `/netonly` and a domain\user combo.

	runas /netonly /user:THE_DOMAIN\THE_USER "C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe"

## What is the parameter `/netonly` ?

> netonly
>
> use if the credentials specified are for remote access only.