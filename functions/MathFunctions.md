# Math Functions

- `PI`(): Returns the value of the constant PI to 15 digits of accuracy
- `RAND`(): Returns a random number between 0 and 1
- `NULL`(): Returns a Null value

#### Math

- `ABS`(x): Absolute value of (x). It is the distance between 0 and a number. The value is always positive.
- `ACOS`(x): Arc - Cosine of (x) Returns the arccosine, or inverse cosine, of a number. The arccosine is the angle whose cosine is (x). The returned angle is given in radians in the range 0 (zero) to pi. The number (x) must be between -1 and 1.
- `ASIN`(x): Arc - Sine of (x) Returns the arcsine, or inverse sine, of a number. The arcsine is the angle whose sine is (x). The returned angle is given in radians in the range -pi/2 to pi/2.
- `ATAN`(x): Arc - Tangent of (x) Returns the arctangent, or inverse tangent, of a number. The arctangent is the angle whose tangent is (x). The returned angle is given in radians in the range -pi/2 to pi/2.
- `ATAN2`(y, x): Arc - Tangent of (y/x) Returns the arctangent of y and x.
- `Average`(n1,...): Average of a list of numbers.
- `CEIL`(x): Returns smallest integer greater than or equal to (x). Works like the RoundUp function in Excel.
- `COS`(x): Cosine of (x)
- `COSH`(x) : Hyperbolic Cosine of (x)
- `DISTANCE`(from_Lat,from_Lon, to_Lat, to_Lon): Returns distance from (lat1,Lon1) to (lat2,lon2)
- `EXP`(x): Returns e^x
- `FLOOR`(x): Returns largest integer less than or equal to (x)
- `LOG`(x): Natural logarithm of (x)
- `LOG10`(x): Base 10 logarithm of (x)
- `Median`(...): Calculates the median out of one or more (possibly unsorted) values.
- `Mod`(n,d): Modulo of n divided by d (integer operation). The Modulo operation finds the remainder of one integer (n) divided by a divisor integer (d). If (n) is positive, the result is positive. If (n) is negative, the result is negative. If decimal values are used, the decimal is truncated. This can result in a "Divided by 0" error if the divisor is a decimal less than 1.
- `PI`(): Returns the value of the constant PI to 15 digits of accuracy
- `POW`(x, e): Returns (x) raised to the (e) power
- `RAND`(): Returns a random number between 0 and 1
- `RandInt`(n): Returns a random integer between 0 and the specified parameter
- `Round`(x, mult): Returns (x) rounded to nearest multiple of (mult)
- `SIN`(x): Sine of (x)
- `SINH`(x): Hyperbolic Sine of (x)
- `SmartRound`(x): Returns (x) rounded to nearest multiple of a value determined dynamically based on the size of (x)
- `SQRT`(x): Square root of (x)
- `TAN`(x): Tangent of (x)
- `TANH`(x): Hyperbolic Tangent of (x)


#### Math: Bitwise

- `BinaryAnd`(n,m): Returns a binary of n and m. The result is 1 if both n and m are 1, and 0 otherwise. If 0 is equated with false, and 1 with true the BinaryAnd operation works like a logical And.
- `BinaryNot`(n): Returns a Binary Not of n
- `BinaryOr`(n,m): Returns a Binary Or of n and m
- `BinaryXOr`(n,m): Returns a Binary XOr of n and m
- `ShiftLeft`(n,b): Left shifts n (as integer) by b bits
- `ShiftRight`(n,b): Right shifts n (as integer) by b bits

#### Min/Max

- `Bound`(x, min, max): If (x < min) return min; else if (x > max) return max; else return x
- `Max`(v0, v1,..., vn): Returns the maximum value from the list.
- `MaxIDX`(v0, v1,..., vn): Returns the 0 based index of the maximum value from the list.
- `Min`(v0, v1,..., vn): Returns the minimum value from the list.
- `MinIDX`(v0, v1,..., vn): Returns the 0 based index of the minimum value from the list.
