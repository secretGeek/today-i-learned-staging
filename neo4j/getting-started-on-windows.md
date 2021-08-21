# Getting started with neo4j on windows

As a hobbyist/dabbler -- first thing was:

Download the "Community Edition" from the [download center](https://neo4j.com/download-center/#community)

I got the "Neo4j 4.1.1 (zip)"

(There was a bunch of other things I could download - I ignored those for now)

They really wanted me to download "Neo4J Desktop"
...what's that?

> Neo4j Desktop is a convenient way for developers to work with local Neo4j databases.

Sounds good!

> While most functionality is the same, the instructions in this manual are not written for Neo4j Desktop. For example, file locations for a database installed via Neo4j Desktop will be different from those described here.

Oh, sounds bad?

Found a better guide....

- [5 QUICK STEPS TO GETTING STARTED WITH NEO4J 2.2.3 ON WINDOWS OS](https://kvangundy.com/wp/5-quick-steps-to-getting-started-with-neo4j-2-2-3-on-windows-os/) -- **2015** article that is actually on the topic!

...step 2 "Go ahead and run the installer" -- hmm - the download for comunity edition is a zip not an installer.

Maybe i should get the desktop edition instead then.

For that I had to give them my "business" email -- I thought they would reject gmail, but they did not.

They did give me a giant neo4j activation key, 704 bytes of random junk.

Okay -- so now I have...

	neo4j-desktop-offline-1.3.4-setup.exe

Installing to here:

	C:\Users\MyUser\AppData\Local\Programs\Neo4j Desktop

Some firewall stuff had to be investigated....

Now setting a path where I "want" to store application data, going with the default

	C:\Users\MyUser\.Neo4jDesktop

Now I got to paste in the huge key, the 704 bytes of random junk I received earlier.

OKay -- now I get to play, it's interesting already.

I need to store something in csv that is interesting (to me at least)

and then load it up in the graph database.

-- a goal here is to get to a point where I'm playing with [cypher - the neo4j query language](https://www.quackit.com/neo4j/tutorial/neo4j_query_language_cypher.cfm)

(a fun idea would be to export my genealogical data et al from `boothby` as csv into `neo4j` desktop and explore that;

## Source(s)

- ["This section describes how to install Neo4j on Windows."](https://neo4j.com/docs/operations-manual/current/installation/windows/) -- nah it doesn't. It describes things "related" to that topic. But nothing about that really.
- [5 QUICK STEPS TO GETTING STARTED WITH NEO4J 2.2.3 ON WINDOWS OS](https://kvangundy.com/wp/5-quick-steps-to-getting-started-with-neo4j-2-2-3-on-windows-os/) -- 2015 article that is actually on the topic!

## See also
