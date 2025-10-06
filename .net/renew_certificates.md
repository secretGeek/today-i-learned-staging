# Renew certificates in a .net project on windows

When you create an asp.net web application and develop it in visual studio, it also creates self signed certificates (a PEM and a Key) file stored in `$ENV:APPDATA\ASP.NET\Https`.

For example, a solution called `Project1` might create files called:

	$ENV:APPDATA\ASP.NET\Https\project1.client.key
	$ENV:APPDATA\ASP.NET\Https\project1.client.pem

These will have an expiry of one year.

One year later they will need to be renewed.

If things go well, this may happen automatically. Perhaps visual studio will prompt you to make sure it's ok. I don't know.

The only thing I know about it what it feels like when it goes *wrong*. It gets very confusing. You've changed nothing, and yet a project that worked yesterday does not work today.

Allegedly you can run 


	dotnet dev-certs https --clean
	dotnet dev-certs https --trust


But the solution that worked for me was to delete the files and re-load the project in visual studio, so they would be re-created.

Actually, it's less drastic than that. I didn't **delete** the files, I "zz'd" them: I renamed them to have a "zz_" prefix at the staert of their name, so that they would not be found. That's it.

Then, when I restarted visual studio I found that new files had been created.

  

## Some notes on diagnosis

i could see that there was an allegedly expired  certificate by looking at the certificate warning in Chrome or Edge.

I found the name of the certificate file(s) by looking at the config for "vite". 

In `vite.config.ts` I could see it was looking in `$ENV:Appdata/ASP.NET/https/` for a specific `.pem` and `.key` file.

So I went to that folder, and saw a bunch of files, with `.pfx`, `.pem` and `.key` file types. The relevant ones, named after my problem project, were easy to spot.


## Inspect certificates

Also -- you can inspect the relevant certificates, from powershell, by running this query, which looks in the `Cert:` Powershell drive.

	 
	 
	Get-ChildItem Cert:\CurrentUser\My | Where-Object { $_.Subject -like '*localhost*' } | select -prop *







