The purpose of this library is to make resizeable windows easier, espescially for pixel art games but it should work for high res stuff too.

```import('path/to/window')```

### Load

```function window.load(resx, resy, sizex, sizey)```
will set it all up.

### Update
No updating necessary! The math is pretty simple and is done during the draw process. 


### Draw
In `love.draw`:  

Call 
```window.start_draw()```
before drawing anything. This will set the global draw canvas.

Then you draw your game like normal.

Call 
```window.end_draw()```
this will draw the canvas in the appropriate size on the main canvas, with appropriate borders and stuff
before drawing anything. this will set the canvas to the smaller canvas that you want.
`window.end_draw()` 
this will draw the canvas in the appropriate size on the main canvas, with appropriate borders and stuff.
