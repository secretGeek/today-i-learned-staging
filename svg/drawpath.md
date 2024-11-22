# Draw Path

## A few svg path commands

(in the following rel. means relative and abs. means absolute.

| __Letter__ | Meaning | `Sample` | Params | _Note_ |
|--------|---------|--------|------|----|
|   __M__    | Move to | `M 10 30` | (X,Y)+ | _set current point to abs._ (10,30) |
|   __m__   | move delta | `m 1 2` | (dx,dy)+ | _change current point by rel._ (1,2) |
|   __L__    | Line to | `L 10 20` | (dx,dy)+ | _line from current point, to rel._ (10,20) |
|        |  | `L 10 20 30 40` | (dx,dy)+ | _line from current point to rel._ (10,20) _and line from there to rel._ (30,40) |
|   __H__    | Horiz Line to | `H 10` | x+ | _horiz line from current point to abs._ x _of_ 10 |
|   __h__    | Horiz Line delta | `h 10` | dx+ | _horiz line from current point to rel._ x _of_ x + 10 |
|        |  | `h -10` | dx+ | _horiz line from current point to rel._ x _of_ x - 10 |
|   __V__    | Vert Line to | `V 10` | y+ | _vertical from current point to_ y _of_ 10 |
|   __v__    | Vert Line delta | `v 10` | dy+ | _vertical from current point to rel._ y _of_ y + 10 |
|            |                 | `v -10` | dy+ | _vertical from current point to rel._ y _of_ y - 10 |
|   __C__    | Cubic Bézier | `C 30,90 25,10 50,10` | (x1,y1, x2,y2, x,y)+ | _from current point to end point_ x,y _with control points at_ x1,y1 _and_ x2,y2 |
|    |  | `C 30,90 25,10 50,10 10,25 90,30 10,50` | (x1,y1, x2,y2, x,y)+ | _subsequent triplets of pairs continue the curve_ |
|   __c__    | relative Cubic Bézier  | `C 30,90 25,10 50,10` | (dx1,dy1, dx2,dy2, dx,dy)+ | _from current point to relative end point_ x,y _with relative control points at_ dx1,dy1 _and_ dx2,dy2 |
|   __C__    | Cubic Bézier | `C 30,90 25,10 50,10` | (x1,y1, x2,y2, x,y)+ | _from current point to end point_ x,y _with control points at_ x1,y1 _and_ x2,y2 |
|    |  | `C 30,90 25,10 50,10 10,25 90,30 10,50` | (x1,y1, x2,y2, x,y)+ | _subsequent triplets of pairs continue the curve_ |
|   __S__    | Smooth Cubic Bézier  | `S 20,50 80,110` | (x2, y2, x, y)+ | _from current point to end point_ x,y _with end control point_ x2, y2 _and start control point of previous control point or current point if previous curve wasn't a cubic bézier_ |
|   __Q__    | Quadratic Bézier  |
|   __q__ | Relative Quad Béz |
|   __T__ | Smooth Quad Béz |
|   __t__ | Realitve smooth quad Béz |
|   __A__    | Arc curve |
|   __a__ | Relative Arc curve |
|   __Z__ | Close path |


```svg
<svg width="190" height="210" xmlns="http://www.w3.org/2000/svg">
  <path d="M 10 10 20 20" stroke="red" fill="transparent"/>
  <path d="M 40 20 50 10" stroke="red" fill="transparent"/>
  <path d="M 10 10 C 20 20, 40 20, 50 10" stroke="black" fill="transparent"/>
	  <path d="M 70 10 70 20" stroke="red" fill="transparent"/>
	  <path d="M 110 20 110 10" stroke="red" fill="transparent"/>
	  <path d="M 70 10 C 70 20, 110 20, 110 10" stroke="black" fill="transparent"/>
		  <path d="M 130 10 120 20" stroke="red" fill="transparent"/>
		  <path d="M 180 20 170 10" stroke="red" fill="transparent"/>
		  <path d="M 130 10 C 120 20, 180 20, 170 10" stroke="black" fill="transparent"/>
  <path d="M 10 60 20 80" stroke="red" fill="transparent"/>
  <path d="M 40 80 50 60" stroke="red" fill="transparent"/>
  <path d="M 10 60 C 20 80, 40 80, 50 60" stroke="black" fill="transparent"/>
	  <path d="M 70 60 70 80" stroke="red" fill="transparent"/>
	  <path d="M 110 80 110 60" stroke="red" fill="transparent"/>
	  <path d="M 70 60 C 70 80, 110 80, 110 60" stroke="black" fill="transparent"/>
		  <path d="M 130 60 120 80" stroke="red" fill="transparent"/>
		  <path d="M 180 80 170 60" stroke="red" fill="transparent"/>
		  <path d="M 130 60 C 120 80, 180 80, 170 60" stroke="black" fill="transparent"/>
  <path d="M 10 110 20 140" stroke="red" fill="transparent"/>
  <path d="M 40 140 50 110" stroke="red" fill="transparent"/>
  <path d="M 10 110 C 20 140, 40 140, 50 110" stroke="black" fill="transparent"/>
	  <path d="M 70 110 70 140" stroke="red" fill="transparent"/>
	  <path d="M 110 140 110 110" stroke="red" fill="transparent"/>
	  <path d="M 70 110 C 70 140, 110 140, 110 110" stroke="black" fill="transparent"/>
		  <path d="M 130 110 120 140" stroke="red" fill="transparent"/>
		  <path d="M 180 140 170 110" stroke="red" fill="transparent"/>
		  <path d="M 130 110 C 120 140, 180 140, 170 110" stroke="black" fill="transparent"/>
  <!-- recreate that first line... but using relative coords, l and c -->
  <path d="M 10 160 l 10 10" stroke="pink" fill="transparent"/>
  <path d="M 50 160 l -10 10" stroke="pink" fill="transparent"/>
  <path d="M 10 160 c 10 10, 30 10, 40 0" stroke="blue" fill="transparent"/>
</svg>
```

<svg width="190" height="210" xmlns="http://www.w3.org/2000/svg">
  <path d="M 10 10 20 20" stroke="red" fill="transparent"/>
  <path d="M 40 20 50 10" stroke="red" fill="transparent"/>
  <path d="M 10 10 C 20 20, 40 20, 50 10" stroke="black" fill="transparent"/>
	  <path d="M 70 10 70 20" stroke="red" fill="transparent"/>
	  <path d="M 110 20 110 10" stroke="red" fill="transparent"/>
	  <path d="M 70 10 C 70 20, 110 20, 110 10" stroke="black" fill="transparent"/>
		  <path d="M 130 10 120 20" stroke="red" fill="transparent"/>
		  <path d="M 180 20 170 10" stroke="red" fill="transparent"/>
		  <path d="M 130 10 C 120 20, 180 20, 170 10" stroke="black" fill="transparent"/>
  <path d="M 10 60 20 80" stroke="red" fill="transparent"/>
  <path d="M 40 80 50 60" stroke="red" fill="transparent"/>
  <path d="M 10 60 C 20 80, 40 80, 50 60" stroke="black" fill="transparent"/>
	  <path d="M 70 60 70 80" stroke="red" fill="transparent"/>
	  <path d="M 110 80 110 60" stroke="red" fill="transparent"/>
	  <path d="M 70 60 C 70 80, 110 80, 110 60" stroke="black" fill="transparent"/>
		  <path d="M 130 60 120 80" stroke="red" fill="transparent"/>
		  <path d="M 180 80 170 60" stroke="red" fill="transparent"/>
		  <path d="M 130 60 C 120 80, 180 80, 170 60" stroke="black" fill="transparent"/>
  <path d="M 10 110 20 140" stroke="red" fill="transparent"/>
  <path d="M 40 140 50 110" stroke="red" fill="transparent"/>
  <path d="M 10 110 C 20 140, 40 140, 50 110" stroke="black" fill="transparent"/>
	  <path d="M 70 110 70 140" stroke="red" fill="transparent"/>
	  <path d="M 110 140 110 110" stroke="red" fill="transparent"/>
	  <path d="M 70 110 C 70 140, 110 140, 110 110" stroke="black" fill="transparent"/>
<path d="M 130 110 120 140" stroke="red" fill="transparent"/>
<path d="M 180 140 170 110" stroke="red" fill="transparent"/>
<path d="M 130 110 C 120 140, 180 140, 170 110" stroke="black" fill="transparent"/>
<!-- recreate that first line... but using relative coords, l and c -->
<path d="M 10 160 l 10 10" stroke="pink" fill="transparent"/>
<path d="M 50 160 l -10 10" stroke="pink" fill="transparent"/>
<path d="M 10 160 c 10 10, 30 10, 40 0" stroke="blue" fill="transparent"/>
</svg>

## See also

- [Drawing a square with svg](drawsquare.md)
- [How to draw a circle with svg](drawcircle.md)
- [How to use an svg as a website or web page's favicon](svg-to-favicon.md)
- [How to convert an svg to a Windows .ico icon file, with inkScape and Magick (via Powershell)](svg-to-ico-file.md)
