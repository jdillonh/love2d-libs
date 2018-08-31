
#animation.lua


This is a library to abstract some of the complicated aspects of drawing sprite-based animations
in Löve2d. The API is fairly simple and has two main modes.


include it in your project with:
```lua
local animation = require "animation.lua"
```


##Creating a new animation object
The constructor for animation objects is:
    animation.new(path, n_of_frames, frame_delay, x, y, [sx], [sy], [rotation])

**Path** is a path to your sprite sheet, **n_of_frames** is the number of frames in your animation,
**frame_delay** how long each frame lasts (seconds of update-cycles), **x** x position on the screen/canvas to draw the animation, **y** y position on the screen/canvas to draw the animation, **sx** (optional, default = 1) scale factor in the x direction, **sy** (optional, default = 1) scale factor in the y direction, **rot** (optional, default 0) the rotation in radians. 
