# tools for sqlite

## development environments

- sqlitestudio - https://sqlitestudio.pl/ - create edit browse sqlite databases
- sqlite plugins in vs code ?

simonw (simon willison) --

- sqlite-utils

https://simonwillison.net/2019/Feb/25/sqlite-utils/ -

> sqlite-utils is a combination Python library and command-line tool I've been building over the past six months which aims to make creating new SQLite databases as quick and easy as possible.
>
>
>
> Given a json file - e.g.

	import requests
	import sqlite_utils

	db = sqlite_utils.Database("countries.db")
	db["countries"].insert_all(
		requests.get(
			"https://example.com/countries.json"
		).json(),
		pk="id"
	)

> To inspect the corresponding sqlite database with dataasette....
>

	datasette countries.db -o

...it will `-o`pen your browser to http://127.0.0.1:8001/
