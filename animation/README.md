
# animation.lua


This is a library to abstract some of the complicated aspects of drawing sprite-based animations
in Löve2d. The API is fairly simple.


include it in your project with:
```lua
local animation = require "animation.lua"
```


## Creating a new animation object
The constructor for animation objects is:
```lua
new_anim = animation.new(path, n_of_frames, frame_delay, x, y, [sx], [sy], [rotation])
```
**path**: is a path to your sprite sheet   
**n_of_frames**: is the number of frames in your animation  
**frame_delay**: how long each frame lasts (seconds of update-cycles)  
**x**: x position on the screen/canvas to draw the animation  
**y**: y position on the screen/canvas to draw the animation  
**sx**: (optional, default = 1) scale factor in the x direction  
**sy**: (optional, default = 1) scale factor in the y direction  
**rot**: (optional, default 0) the rotation in radians 


## Updating each animation object
Every animation object needs to be updated every frame. Call it in `love.update()`.
```lua
new_anim:update([dt], [new_x], [new_y])
```
**dt**: this is the dt value set by `love.update(dt)`, For extra control `dt` can be left out, **if it is not included then the _frame_delay_ variable will be treated as a number of update cycles, not a number of seconds**. If you are unsure, inlcude dt.  
**new_x**: This will change the x-position of the animation to the one provided.  
**new_y**: This will change the y-position of the animation to the one provided.  


## Drawing an animation object
In order to see your animation, you must draw it (duh). Call it in `love.draw()`.
```lua
new_anim:draw()
```
Takes, no arguments. Nice and easy.

