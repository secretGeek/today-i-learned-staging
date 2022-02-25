# Split cell to words, via a formula, in Excel

To get everything before the first space:

	=LEFT(B2,FIND(" ",B2)-1)

BETTER: get everything before the first space, but if there is not space get everything:

	=IFERROR(LEFT(B2,FIND(" ",B2)-1), B2)

Get everything after the first space

	=TRIM(RIGHT(B2, LEN(B2) - LEN(F2)))
	

...where `F2` is the column holding the output from the formula above (`=IFERROR(LEFT(B2,FIND(" ",B2)-1), B2)`)




## See also

- [Avoid `#VALUE!` with IFERROR](if_error.md)