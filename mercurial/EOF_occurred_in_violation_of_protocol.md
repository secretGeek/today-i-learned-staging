﻿# Abort: error: _ssl.c:504: EOF occurred in violation of protocol

You may get this error, as I do on "machine 1":

	> hg in
	abort: error: _ssl.c:504: EOF occurred in violation of protocol

with this version of hg:

	> hg --version
	Mercurial Distributed SCM (version 2.2.3)

And this version of python:

	> python --version
	Python 2.7.9

**Or** you may get this error, as I do on "machine 2":

	> hg in
	abort: error: EOF occurred in violation of protocol (_ssl.c:661)

with this version of hg:

	> hg --version
	Mercurial Distributed SCM (version 4.6.1)

...it's not caused by the client's version of mercurial.

It doesn't happen on local actions. It happens when talking to the server. The server in this case is bitbucket.

The cause is this recent change at bitbucket:

* [Bitbucket: Deprecating TLSv1 and TLSv1.1](https://bitbucket.org/blog/deprecating-tlsv1-tlsv1-1-2018-12-01)

> The Mercurial command line on UNIX-based systems may be affected; please check your version of Python (with `python -V`). Versions 2.7.9 and later are unaffected, and most versions earlier than 2.7.9 are affected

I have Python 2.7.9 (on windows command line, machine 1) yet I am affected. How so?

Having that version of python doesn't guarantee that's the version that `hg.exe` is using.

As it says at the page above:

> Upgrade anything that is affected, before 1 December 2018.

How *do* I upgrade mercurial? The page called [Upgrading Mercurial](https://www.mercurial-scm.org/wiki/UpgradingMercurial) doesn't tell you how to upgrade mercurial tooling. Instead it gives you notes about some issues that arise when upgrading the version of a repository.

It's quite frustrating actually.

So my decision is: upgrade `thg` (Tortoise Hg), and see if that takes care of it.

You get it from here:

* <https://www.mercurial-scm.org/wiki/Download#Windows>

The first thing to work out is if I want 32 or 64 bit `thg`. I run my local thg and observe in Task Manager that it is not marked as a 32 bit program, so infer that it must be 64 bit.

I install that, it's a bit of a worry because I'm installing "over" the old version, not really replacing it...

The installation requires either that I let it restart chrome and explorer.exe, or I reboot. Both are a hassle. I opt for the former, and expect explorer.exe to never come back.

Currently I'm typing into a text editor, while explorer.exe is not running. It's a strange feeling, like i'm floating in the air.

After two restarts I would say I've had *mixed* success.

Checking the version of mercurial now returns:

	> hg --version
	*** failed to import extension helloworld from C:\Program Files\TortoiseHg\hgext\helloworld.py: 'module' object has no attribute 'norepo'
	*** failed to import extension timetracker from C:\Program Files\TortoiseHg\hgext\timetracker.py: missing attributes: norepo, optionalrepo, inferrepo
	*** (use @command decorator to register 'timetracker')
	*** failed to import extension versions from C:\Program Files\TortoiseHg\hgext\versions.py: 'module' object has no attribute 'norepo'
	Traceback (most recent call last):
	  File "mercurial\extensions.pyo", line 202, in _runuisetup
	  File "C:/Program Files/TortoiseHg/hgext/patience.py", line 135, in uisetup
	  File "mercurial\extensions.pyo", line 494, in wrapfunction
	  File "hgdemandimport\demandimportpy2.pyo", line 145, in __getattr__
	  File "hgdemandimport\demandimportpy2.pyo", line 90, in _load
	  File "hgdemandimport\demandimportpy2.pyo", line 41, in _hgextimport
	ImportError: No module named bdiff
	*** failed to set up extension patience: No module named bdiff
	Mercurial Distributed SCM (version 4.7.1)
	(see https://mercurial-scm.org for more information)

	Copyright (C) 2005-2018 Matt Mackall and others
	This is free software; see the source for copying conditions. There is NO
	warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Which probably just means my legacy extensions are no longer supported. But mercurial itself is now at 4.7.1.

`hg in` now works. (THough it also reports all of the error messages from above.

So once I clean up my extensions, I should be ok.

(Update: yep, that worked. I just removed mention of the extensions from mercurial.ini)

## Fixing machine 2

Machine 2 had this error:

	> hg in
	abort: error: EOF occurred in violation of protocol (_ssl.c:661)

With mercurial 4.6.1.

Ran the install for tortoise hg 4.8.1 -- bringin the machine up to:

 * Tortoise Hg 4.81
 * Mercurial-4.8.1
 * Python-2.7.13

Which *should* be adequate to get past the problem.

But still receive exact same error:

	> hg in
	abort: error: EOF occurred in violation of protocol (_ssl.c:661)

Okay - after restarting a few times, I resolved it by updating my proxy (in mercurial settings) do a different proxy.

I inspected the corporate script that runs to determine the proxy, and extracted the value from there.