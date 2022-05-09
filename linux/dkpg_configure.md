# dkpg was interrupted, you must manually run 'sudo dpkg --configure -a'

I was supposed to upgrade the "do agent" (digital ocean)

First instruction:

	sudo apt-get purge do-agent

Gave this result:

	E: dpkg was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the problem.


Okay I did that:

	sudo dpkg --configure -a
	dpkg: error processing package bash (--configure):
	 package is in a very bad inconsistent state; you should
	 reinstall it before attempting configuration
	Errors were encountered while processing:
	 bash


sudo apt-get install -f


Okay -- before proceeding I need to see what is on this machine, and make sure I have a backup and other plans.

Then I will restart the computer and do any other obvious fix ups that I can.

Looking then to see if this article can help: [FIXING THE DREADED "ERRORS WERE ENCOUNTERED WHILE PROCESSING" ERRORS](https://journalxtra.com/linux/fixing-the-dreaded-errors-were-encountered-while-processing-errors/)


Check the package cache:

	sudo apt-get check

Update the package cache:

	sudo apt-get update


See if anything is missing, and fix it.

	sudo apt-get upgrade --fix-missing


After a reboot (`sudo reboot`)

I *was* able to run:

	sudo dpkg --configure -a


## Sources

- [How to Upgrade from the Legacy Metrics Agent to the Current Agent](https://docs.digitalocean.com/products/monitoring/how-to/upgrade-legacy-agent/)
- [FIXING THE DREADED “ERRORS WERE ENCOUNTERED WHILE PROCESSING” ERRORS](https://journalxtra.com/linux/fixing-the-dreaded-errors-were-encountered-while-processing-errors/)