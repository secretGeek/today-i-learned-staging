# LAMBDA and LET in Excel

The `LAMBDA` function lets you create custom, reusable functions directly in Excel formulas.

The syntax is:

	=LAMBDA(<parameters>, <formula-using-those-parameters>)(<input>)

## Simplest example of LAMBDA

	=LAMBDA(x, x^2)(5)

...means:

1. Define a lambda, that, when given parameter `x`, returns `x^2`.
2. Now give it an `x` parameter of `5`.
3. Result should be `25`.


## Second example of LAMBDA

	=LAMBDA(a, b, a + b)(3, 4)

...means:

1. Define a lambda, that, when given parameter `a` and `b`, returns `a+b`.
2. Now give it an `a` parameter of `3` and a `b` parameter of `4`.
3. Result should be `7`.

So, as we all know from our boring buddies who bang on about functional programming and the lambda calculus and old mate Alonzo Church, etc, a `lambda` is simply an anonymous function. Note that we essentially defined a `Squared()` function here, but without having to name it `Squared()`, and then we defined an `Add_Two_Numbers()` function, without having to *name* it, `Add_Two_Numbers()`.

Naming, you may recall, is one of the two hardest problems in computer science. So with this one neat trick, Alonzo Church has eradicated 50% of the difficulties of computer science.


## Many parameters

A Lambda can have as many parameters as it needs. e.g. 

	=LAMBDA(a, b, c, d, e, f, a - b + c - d + e - f)(3,4,5,6,7,8)

All of the "parameters" are treated as *input* parameters, and the final parameter is the expression that may use those parameters.


## Why mention LET ?


`LET` is a complementary concept to LAMBDA... as you'll see. But forget LAMBDA for a moment. 

Think instead about a boring repetitive expression like this:


	=SQRT(A1) + SQRT(A1) * 10

Look at all that nasty nasty repetition! Over and over we've had to type that same boring bit, `SQRT(A1)`. Wouldn't it be cool if we could save our fingers all that typing?

Here's how we can let `LET` do it!

`LET` lets you define name and values, then lets you *use* those names, as many times as you want, in an expression.

So we can say:

- "Let `x` be `SQRT(A1)`. Please calculate the expression:  `x + x * 10`"

To say that, we use this syntax:

	=LET(x, SQRT(A1), x + x * 10)

The general syntax being:

	=LET(name1, value1, [name2, value2, ...], calculation)


We could use `LET` with multiple pairs of names and values. For example here is the volume of a rectangular block:


	=LET(
	  height, 5,
	  width, 4,
	  length, 3,
	  volume, height * width * length,
	  volume
	)
	
which in pseudo-code could be written like this:

	LET
	  height = 5
	  width = 4,
	  length = 3,
	  volume =  height * width * length
	RETURN the answer: 
	  volume
	


That's kind of cool... but intermingling our variables and our values is pretty messy.

To avoid that intermingling, we can combine LET with LAMBDA to make a function, like this:


	=LAMBDA(height, width, length,
	  LET(
		volume, height * width * length,
		volume
	  )
	)(5, 4, 3)



## PROPER reusable functions without macros

But even better, you can define an actual reusable function -- by doing the following:

1. Go to "Formulas" > "Name Manager"
2. Click "New"
3. Give your new formula a name, e.g. `BlockVolume`
4. And define the formula:

	=LAMBDA(height, width, length,
	  LET(
		volume, height * width * length,
		volume
	  )
	)

Now, anywhere within your spreadsheet you can use your custom `BlockVolume` function:

	=BlockVolume(A2, B2, C2)

Excellent! And, ah, remember to choose sensible names. We didn't escape that problem at all, in the end.


## Source(s)

- [Is there an Excel function to create a hash value? - Super User](https://superuser.com/questions/550592/is-there-an-excel-function-to-create-a-hash-value) &mdash; some of the answers at this question made me want to write down what `LET` and `LAMBDA` are all about in Excel.

