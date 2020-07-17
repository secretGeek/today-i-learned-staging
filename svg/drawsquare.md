# Drawing a square with svg

Here is the codes:

	<svg width="400" height="110">
		<rect width="100" height="100" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />
	</svg>


<svg width="400" height="110">
  <rect width="300" height="100" style="fill:rgb(255,255,30,0.0);stroke-width:1;stroke:rgb(255,128,0)" />
</svg>

 - `stroke-width` e.g. 1, 2, 10%.
 - `stroke` (color) e.g. rgb(255,127,63), green 



# Stroke Example (also a circle example)
Can define a stroke using another element.



<svg width="200" height="200">
	<circle cx="100" cy="100" r="97" fill="none"
			stroke="url(#myGradient)" />
	<defs>
		<linearGradient id="myGradient">
		<stop offset="0%"   stop-color="green" />
		<stop offset="100%" stop-color="white" />
		</linearGradient>
	</defs>
</svg>

	<svg width="200" height="200">
		<circle cx="100" cy="100" r="97" fill="none"
				stroke="url(#myGradient)" />
		<defs>
			<linearGradient id="myGradient">
			<stop offset="0%"   stop-color="green" />
			<stop offset="100%" stop-color="white" />
			</linearGradient>
		</defs>
	</svg>



<svg width="110" height="110" style='padding:10;background-color:red;'>
	<rect width="100" height="100" style="fill:rgb(255,200,64);stroke-width:3;stroke:rgb(255,255,255)" />
</svg>


<svg width="110" height="110" style='margin:5;padding:5;background-color:purple;'>
	<rect width="100" height="100" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />
</svg>

<svg width="110" height="110">
	<rect width="100" height="100" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />
</svg>

<svg width="110" height="110">
	<rect width="100" height="100" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />
</svg>



<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <pattern id="smallGrid" width="8" height="8" patternUnits="userSpaceOnUse">
      <path d="M 8 0 L 0 0 0 8" fill="none" stroke="gray" stroke-width="0.5" />
    </pattern>
    <pattern id="grid" width="80" height="80" patternUnits="userSpaceOnUse">
      <rect width="80" height="80" fill="url(#smallGrid)"/>
      <path d="M 80 0 L 0 0 0 80" fill="none" stroke="gray" stroke-width="1" />
    </pattern>
  </defs>

  <rect width="100%" height="100%" fill="url(#grid)" />
</svg>

# svg path commands


| __Letter__ | Meaning | `Sample` | Params | _Note_ |
|--------|---------|--------|------|----|
|   __M__    | Move to | `M 10 30` | (X,Y)+ | _set current point to_ (10,30) |
|   __m__   | move delta | `m 1 2` | (dx,dy)+ | _change current point by_ (1,2) |
|   __L__    | Line to | `L 10 20` | (dx,dy)+ | _line from current point to_ (10,20) |
|        |  | `L 10 20 30 40` | (dx,dy)+ | _line from current point to_ (10,20) _and line from there to_ (30,40) |
|   __H__    | Horiz Line to | `H 10` | x+ | _horiz line from current point to_ x _of_ 10 |
|   __h__    | Horiz Line delta | `h 10` | dx+ | _horiz line from current point to_ x _of_ x + 10 |
|        |  | `h -10` | dx+ | _horiz line from current point to_ x _of_ x - 10 |
|   __V__    | Vert Line to | `V 10` | y+ | _vertical from current point to_ y _of_ 10 |
|   __v__    | Vert Line delta | `v 10` | dy+ | _vertical from current point to_ y _of_ y + 10 |
|            |                 | `v -10` | dy+ | _vertical from current point to_ y _of_ y - 10 |
|   __C__    | Cubic Bézier | `C 30,90 25,10 50,10` | (x1,y1, x2,y2, x,y)+ | _from current point to end point_ x,y _with control points at_ x1,y1 _and_ x2,y2 |
|    |  | `C 30,90 25,10 50,10 10,25 90,30 10,50` | (x1,y1, x2,y2, x,y)+ | _subsequent triplets of pairs continue the curve_ |
|   __c__    | relative Cubic Bézier  | `C 30,90 25,10 50,10` | (dx1,dy1, dx2,dy2, dx,dy)+ | _from current point to relative end point_ x,y _with relative control points at_ dx1,dy1 _and_ dx2,dy2 |
|   __C__    | Cubic Bézier | `C 30,90 25,10 50,10` | (x1,y1, x2,y2, x,y)+ | _from current point to end point_ x,y _with control points at_ x1,y1 _and_ x2,y2 |
|    |  | `C 30,90 25,10 50,10 10,25 90,30 10,50` | (x1,y1, x2,y2, x,y)+ | _subsequent triplets of pairs continue the curve_ |
|   __S__    | Smooth Cubic Bézier  | `S 20,50 80,110` | (x2, y2, x, y)+ | _from current point to end point_ x,y _with end control point_ x2, y2 _and start control point of previous control point or current point if previous curve wasn't a cubic bezier_ |
|   __Q__    | Quadratic Bézier  | 
|   __q__ | Relative Quad Béz |
|   __T__ | Smooth Quad Béz |
|   __t__ | Realitve smooth quaz Béz |
|   __A__    | Arc curve | 
|   __a__ | Relative Arc curve |
|   __Z__ | Close path |



<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg" style='background-color:#FFF'>
  <defs>
    <pattern id="grid2" width="12" height="10" patternUnits="userSpaceOnUse">
	<path d="M 12 0 L 0 0 0 10" fill="none" stroke="gray" stroke-width="0.5" />
    </pattern>
  </defs>
  <rect width="100%" height="100%" fill="url(#grid2)" />
</svg>


<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg" style='background-color:#FFF'>
  <defs>
    <pattern id="grid1212" width="12" height="12" patternUnits="userSpaceOnUse">
	<path d="M 12 0 L 0 0 0 12" fill="none" stroke="gray" stroke-width="0.5" />
    </pattern>
  </defs>
  <rect width="100%" height="100%" fill="url(#grid1212)" />
</svg>



<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg" style='background-color:none'>
  <defs>
    <pattern id="gridcc" width="39" height="39" patternUnits="userSpaceOnUse">
	<rect width="35" height="35" style="fill:rgb(128,128,128);stroke-width:1;stroke:rgb(30,30,30)" />
	<path d="M 0 0 L 7 0 28 10 28 0 35 0 35 15 28 15 7 5 7 15 0 15 0 0 C" fill="#48F" stroke="#000" stroke-width="1" />
	<path d="M 0 15 L 35 15 35 20 21 20 21 35 14 35 14 20 0 20 0 15 C" fill="#48F" stroke="#000" stroke-width="1" />
    </pattern>
  </defs>
  <rect width="380" height="380" fill="url(#gridcc)" />
</svg>



<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg" style='background-color:none'>
  <defs>
    <pattern id="gridcc2" width="39" height="39" patternUnits="userSpaceOnUse">
	<rect width="35" height="35" style="fill:rgb(128,128,128);stroke-width:1;stroke:rgb(30,30,30)" />
	<path d="M 0 0 L 21 0 28 10 28 0 35 0 35 15 14 15 7 5 7 15 0 15 0 0 C" fill="#48F" stroke="#000" stroke-width="1" />
	<path d="M 0 15 L 35 15 35 25 28 25 28 35 14 35 14 25 0 25 0 15 C" fill="#48F" stroke="#000" stroke-width="1" />
    </pattern>
  </defs>
  <rect width="380" height="380" fill="url(#gridcc2)" />
</svg>


<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg" style='background-color:none'>
  <defs>
    <pattern id="gridcc3" width="39" height="39" patternUnits="userSpaceOnUse">
	<rect width="35" height="35" style="fill:rgb(128,128,128);stroke-width:1;stroke:rgb(30,30,30)" />
	<path d="M 0 0 L 17.5 0 28 10 28 0 35 0 35 15 17.5 15 7 5 7 15 0 15 0 0 C" fill="#48F" stroke="#000" stroke-width="1" />
	<path d="M 0 15 L 35 15 35 25 28 25 28 35 7 35 7 25 0 25 0 15 C" fill="#48F" stroke="#000" stroke-width="1" />
    </pattern>
  </defs>
  <rect width="380" height="380" fill="url(#gridcc3)" />
</svg>


<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg" style='background-color:none'>
  <defs>
    <pattern id="gridcc4" width="39" height="39" patternUnits="userSpaceOnUse">
	<rect width="35" height="35" style="fill:rgb(128,128,128);stroke-width:1;stroke:rgb(30,30,30)" />
	<path d="M 0 0 L 17.5 0 26.25 10 26.25 0 35 0 35 15 17.5 15 8.75 5 8.75 15 0 15 0 0 C" fill="#48F" stroke="#000" stroke-width="1" />
	<path d="M 0 15 L 35 15 35 25 26.25 25 26.25 35 8.75 35 8.75 25 0 25 0 15 C" fill="#48F" stroke="#000" stroke-width="1" />
    </pattern>
  </defs>
  <rect width="380" height="380" fill="url(#gridcc4)" />
</svg>


<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg" style='background-color:none'>
  <defs>
    <pattern id="gridcc5" width="39" height="39" patternUnits="userSpaceOnUse">
	<rect width="35" height="35" style="fill:black;stroke:none" />
	<path d="M 0 0 L 17.5 0 26.25 10 26.25 0 35 0 35 15 17.5 15 8.75 5 8.75 15 0 15 0 0 C" fill="white" stroke="#000" stroke-width="1" />
	<path d="M 0 15 L 35 15 35 25 26.25 25 26.25 35 8.75 35 8.75 25 0 25 0 15 C" fill="#26A" stroke="#000" stroke-width="1" />
    </pattern>
  </defs>
  <rect width="380" height="380" fill="url(#gridcc5)" />
</svg>



## On Dark Mode

<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg" style='background-color:black'>
  <defs>
    <pattern id="gridNWhiteTGrayBackBlack" width="39" height="39" patternUnits="userSpaceOnUse">
	<rect width="35" height="35" style="fill:black;stroke:none" />
	<path d="M 0 0 L 17.5 0 26.25 10 26.25 0 35 0 35 15 17.5 15 8.75 5 8.75 15 0 15 0 0 C" fill="white" stroke="none" />
	<path d="M 0 15 L 35 15 35 25 26.25 25 26.25 35 8.75 35 8.75 25 0 25 0 15 C" fill="#88A" stroke="none" />
    </pattern>
  </defs>
  <rect width="380" height="380" fill="url(#gridNWhiteTGrayBackBlack)" />
</svg>

## On Light Mode

<svg width="401" height="401" xmlns="http://www.w3.org/2000/svg" style='background-color:white'>
  <defs>
    <pattern id="gridNBlackTGrayBackWhite" width="39" height="39" patternUnits="userSpaceOnUse">
	<rect width="35" height="35" style="fill:white;stroke:none" />
	<path d="M 0 0 L 17.5 0 26.25 10 26.25 0 35 0 35 15 17.5 15 8.75 5 8.75 15 0 15 0 0 C" fill="black" stroke="none" />
	<path d="M 0 15 L 35 15 35 25 26.25 25 26.25 35 8.75 35 8.75 25 0 25 0 15 C" fill="#88A" stroke="none" />
    </pattern>
  </defs>
  <rect width="380" height="380" fill="url(#gridNBlackTGrayBackWhite)" />
</svg>


(Idea for a NimbleText logo redesign.)