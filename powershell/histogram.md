# Histograms in Powershell

You can use the group-object to do standard grouping.

This shows all of the files in the current folder, grouped into buckets according to their size.
Each bucket is 1000 bytes.

	dir |
		group-object -property { [int]($_.length / 1000) } | sort @{e={$_.Name -as [int]}} |
			format-table @{Expression={[string]([int]($_.Name) * 1000) + "-" + [string](-1+([int]($_.Name)+1) * 1000)};Label="Bucket";width=10},
				@{Expression={$_.Count};Label="Count";width=10},
				@{Expression={$_.Group};Label="Members";width=50} -autosize

*Consider* running the initial `dir` recursively with `-rec`

## Group by file type

Exclude directories (but include their files)

	dir -rec -file | group-object -property extension | sort count -desc

(An older method was to use `dir -rec | ?{ $_.PSIsContainer -ne $true } ` ... instead of `-file`)

## Bucket all files
...for looking at size of all markdown files in TIL, in buckets of 300 bytes each (but changing the bucket size is easy...)

	$bucketSize = 300; dir . *.md -rec -file |
	group -property { [int]($_.length / $bucketSize) } | sort @{e={$_.Name -as [int]}} |
		format-table @{Expression={[string]([int]($_.Name) * $bucketSize) + "-" + [string](-1+([int]($_.Name)+1) * $bucketSize)};Label="Bucket";width=10},
			@{Expression={$_.Count};Label="Count";width=10},
			@{Expression={$_.Group};Label="Members";width=50} -autosize


## Length of lines in a file

Here's a different, more graphical example of a histogram.

Here we're expressing the number of lines, in a file, that fit within line lengths of 0-100, 100-200, etc.

	cat .\all_jeeves_mega.txt | ? { $_.Length -gt 0 } | % { ([int]($_.Length / 100) * 100) } | sort | group | select -prop Count,Name | % { write-host "$($_.Name.PadLeft(4)) $(([int](100 * $_.Count / 83540)).ToString().PadLeft(3))% $(("*"*[int](100 * $_.Count / 122912)).PadRight(73)) [$($_.Count)]" -f green;}

Here's the result:

	  0  58% ****************************************                                  [48694]
	100  32% **********************                                                    [27082]
	200   7% *****                                                                     [6089]
	300   2% *                                                                         [1379]
	400   0%                                                                           [244]
	500   0%                                                                           [40]
	600   0%                                                                           [11]
	700   0%                                                                           [1]

...which in this case means that P.G.Wodehouse's longest sentence, in all the "Jeeves novel", is between 700 and 800 characters long, and he has 11 sentences from 600-700 characters long, 40 from 500-60, 244 from 400-500 etc.

If we change our "bucket size" down to "25 characters" -- we get a smoother curve:


      0  10% *******                                                                   [8678]
     25  36% ************************                                                  [29742]
     50  20% **************                                                            [16748]
     75  11% *******                                                                   [9084]
    100   7% *****                                                                     [5912]
    125   5% ***                                                                       [4141]
    150   3% **                                                                        [2826]
    175   2% **                                                                        [2020]
    200   2% *                                                                         [1348]
    225   1% *                                                                         [965]
    250   1% *                                                                         [689]
    275   1%                                                                           [453]
    300   0%                                                                           [323]
    325   0%                                                                           [223]
    350   0%                                                                           [147]
    375   0%                                                                           [84]
    400   0%                                                                           [60]
    425   0%                                                                           [36]
    450   0%                                                                           [20]
    475   0%                                                                           [12]
    500   0%                                                                           [10]
    525   0%                                                                           [5]
    550   0%                                                                           [5]
    575   0%                                                                           [5]
    600   0%                                                                           [2]
    625   0%                                                                           [1]
    650   0%                                                                           [1]



Incidentally -- here is the longest sentence in the Jeeves and Wooster stories and novels:



> "The crux of the matter would appear to be, sir, that Mr. Todd is obliged by the conditions under which the money is delivered into his possession to write Miss Rockmetteller long and detailed letters relating to his movements, and the only method by which this can be accomplished, if Mr. Todd adheres to his expressed intention of remaining in the country, is for Mr. Todd to induce some second party to gather the actual experiences which Miss Rockmetteller wishes reported to her, and to convey these to him in the shape of a careful report, on which it would be possible for him, with the aid of his imagination, to base the suggested correspondence."

...and in case you're wondering if this gargantuan sentence simply slips by, it doesn't.

Jeeves has delivered it, toward Bertie and Rocky, and here's the followup:

> Having got which off the old diaphragm, Jeeves was silent. Rocky looked at me in a helpless sort of way. He hasn't been brought up on Jeeves as I have, and he isn't on to his curves.
>
> "Could he put it a little clearer, Bertie?" he said. "I thought at the start it was going to make sense, but it kind of flickered. What's the idea?"

Leading Bertie to paraphrase.

-----

## See also

- [SQL Server: Example query for bucketing up a bunch of values](../sql_server/histogram.md)