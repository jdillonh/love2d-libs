The purpose of this is to make resizeablewindows easier, espescially for pixel art games but it should work for high res stuff too.


`function window.load(resx, resy, sizex, sizey)` will set it all up.


In `love.update`:  
you must call `window.update()` which will setup the canvas drawing math.

In `love.draw`:  
window.start\_draw()
before drawing anything. this will set the canvas to the smaller canvas that you want.
window.end\_draw() 
this will draw the canvas in the appropriate size on the main canvas, with appropriate borders and stuff
before drawing anything. this will set the canvas to the smaller canvas that you want.
window.end\_draw() 
this will draw the canvas in the appropriate size on the main canvas, with appropriate borders and stuff.
