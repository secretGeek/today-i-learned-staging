# Using sylvan tools for csvz

The first tool I've seen that supports the [csvz specification](https://github.com/secretGeek/csvz) is `csvz.exe` from [Sylvan.Data.CsvZip](https://github.com/MarkPflug/Sylvan.Data.CsvZip) by [Mark Pflug](https://markpflug.github.io/).

I've installed it like this:

	dotnet tool install -g Sylvan.Tools.CsvZip --version 0.1.0-b0002

Result:

	> dotnet tool install -g Sylvan.Tools.CsvZip --version 0.1.0-b0002
	mate best match of Sylvan.Tools.CsvZip 0.1.0 was resolved.
	You can invoke the tool using the following command: csvz
	Tool 'sylvan.tools.csvzip' (version '0.1.0') was successfully installed.

I had a folder with some csv files in it (okay, just 1 file)

I ran this command:

	csvz --dir .\business\ --file business.csvz

Here's what happened

	> csvz --dir .\business\ --file business.csvz
	Creating: business.csvz
	Processing people.csv:
		Analyzing. 00:00:00.0085868
		Writing.   00:00:00.0238635
	Done.

It seemed to have worked! There is now a "business.csvz" file.

I copied the resulting `.csvz` file to `.zip`:

	> copy .\business.csvz .\business.zip

... then unzipped it to a new folder called "output":

	> 7z x "business.zip" -ooutput

	7-Zip 19.00 (x86) : Copyright (c) 1999-2018 Igor Pavlov : 2019-02-21

	Scanning the drive for archives:
	1 file, 596 bytes (1 KiB)

	Extracting archive: business.zip
	--
	Path = business.zip
	Type = zip
	Physical Size = 596

	Everything is Ok

	Files: 3
	Size:       319
	Compressed: 596

Now I'll inspect the output folder and see what we have....	

	> cd .\output\
	> tree /f
	Folder PATH listing for volume OS
	Volume serial number is 9472-94B6
	C:.
	|		people.csv
	|
	+---_meta
				columns.csv
				tables.csv

Look ^^  It even has a `_meta` subfolder with `columns.csv` and `tables.csv`

It must've interpeted the types.

Let's see if it got it right?

`_meta\tables.csv` contains:

	filename,bytes,rows,columns,description,published,source
	people.csv,35,2,2,,,

| filename | bytes | rows | columns | description | published | source |
|----------|-------|------|---------|-------------|-----------|--------|
| people.csv | 35 | 2 | 2 |  |  |  |


`_meta\columns.csv` contains:

	filename,column,ordinal,type,nullable,max-length,unique,primary-key,description,units,published,source
	people.csv,Name,0,string,False,5,True,False,,,,
	people.csv,Age,1,int,False,4,True,False,,,,

| filename | column | ordinal | type | nullable | max-length | unique | primary-key | description | units | published | source |
|----------|--------|---------|------|----------|------------|--------|-------------|-------------|-------|-----------|--------|
| people.csv | Name | 0 | string | False | 5 | True | False |  |  |  |  |
| people.csv | Age | 1 | int | False | 4 | True | False |  |  |  |  |

Awesome. It's guessed the types as `string` and `int`. True enough!

I've added it to the [list of known tools for csvz](https://github.com/secretGeek/csvz#a-list-of-csvz-compliant-tools-and-libraries). Nice work Mark!


	
## Source(s)
 
- [Sylvan.Data.CsvZip](https://github.com/MarkPflug/Sylvan.Data.CsvZip)

## See also

- [using sylvan tools for csvz](../csv/using_sylvan_tools_for_csvz.md)