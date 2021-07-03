# How do you reset IIS at the command line? (for continuous integration etc.)


My research indicates the most reliable way to reset IIS is not with `IISRESET` but with these two commands....

	NET STOP iisadmin /y

	NET START w3svc

...and it might be advisable to wait in between the stop and the start.


see https://docs.microsoft.com/en-US/troubleshoot/iis/using-iisreset-restart-iis-result-error
