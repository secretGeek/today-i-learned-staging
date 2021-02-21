# Ensure String Is an Integer

You have a `varchar` or an `nvarchar` but you need to make sure it is an integer (not just a number)


Check if:

	isnumeric(@Id + '.0e0')


...returns 1


For example:

	Declare @id nvarchar(50) = 'axxaxas'
	if isnumeric(@Id + '.0e0') != 1
	BEGIN
	  print 'it is NOT an integer'
	END
	ELSE
	BEGIN
	  print 'it IS an integer'
	END

Note that this allows positive *and negative* integers.


## Ensure String Is a Positive Integer


To further check if a string is a *positive* integer.

	Declare @id nvarchar(50) = '-120'
	print @id
	if isnumeric(@Id + '.0e0') != 1 OR Cast(@id as Int) < 0
	BEGIN
	  print 'it is NOT a positive integer'
	END
	ELSE
	BEGIN
	  print 'it IS a positive integer'
	END