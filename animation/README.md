
# animation.lua


This is a library to abstract some of the complicated aspects of drawing sprite-based animations
in Löve2d. The API is fairly simple and has two main modes, _seconds_ and _frames_. 


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
Every animation object needs to be updated every frame. 
```lua
new_anim:update([dt], [x], [y])
```
**dt**: this is the dt value set by `love.update(dt)`, **if it is not included then the _frame_delay_ variable will be treated
as a number of frames, not a number of seconds**. It is recomended that `:update()` is called within `love.update()`.
