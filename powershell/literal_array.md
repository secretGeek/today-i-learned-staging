# How to create a literal array in powershell

## Create an Empty array

	$data = @()


This works....

## A literal array

	$MyArray = @(
		"Item0";
		"Item1";
		"Item2";
	)

Hell, even this works:

## Literal Array Easy Syntax

	$MyArray = "Item0", "Item1", "Item2";

Both have same type:

	> $MyArray.GetType()
	
result:	
	
	IsPublic IsSerial Name                                     BaseType
	-------- -------- ----                                     --------
	True     True     Object[]                                 System.Array
	

And both contain strings...

	> $MyArray | % { $_.GetType() }

result:

	IsPublic IsSerial Name                                     BaseType
	-------- -------- ----                                     --------
	True     True     String                                   System.Object
	True     True     String                                   System.Object
	True     True     String                                   System.Object
	
So I think the second one is simpler. Go with that.


## Use an array

Access items by index offset (this offset like most offsets is zero-based)

	$MyArray[0]

## Fancy ways to access arrays

	$MyArray[0,5,12]

and

	$MyArray[1..3]

and

	$MyArray[-1..-4]


## Count Items in an arrays

	$MyArray.count

## Last Item in an array

	$MyArray[-1]

## For-Each Through An Array (Iterating)

	$MyArray | ForEach-Object {"Item: [$PSItem]"}

returns

	Item: [Zero]
	Item: [One]
	Item: [Two]
	Item: [Three]

## Add an item to an array



## Sources


- [Everything you wanted to know about arrays](https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-arrays?view=powershell-7.1)

