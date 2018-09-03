
```lua
local timers = require "timers.lua"
```

# timers.lua
timers.lua allows you to create timer objects to keep track of time-based events.

## Creating new timer objects

```lua
my_timer = timers.new( duration, [on_completion], [add_to_global_table] )
```
__duration__ number, the length of the timer.  
__on_completion__ function, will be called automatically once the timer is completed. Default: nil.  
__add_to_global_table__ boolean, add this timer to the global `timer.all` table. See  [below](https://github.com/jdillonh/love2d-libs/blob/master/timers/README.md#updating-timers). Default: false.

## Updating timers
```lua
timer.update_all(dt)
```
will automatically update all of the timers in the global `timer.all` table, and automatically delete 
them when they are finished.  
Otherwise use:  
```lua 
my_timer:update(dt)
```
which will update just my_timer.  
__dt__: delta time, from ```love.update```   
__returns__:__true__ if the timer is finished, __false__ if not.  
  
_Do not call :update(dt) on a timer that has been added to the global table. It will finish too soon._  

### Restart a timer
```lua
my_timer:restart()
```
will start the timer over again.

## Monitor your timers
Using `print` or `tostring` on a timer yeilds the following result:
```lua
> print(my_timer) 

Timer object:
Duration = 2
Time left = 1.25
In global table = False
```  
You can check if a given timer is finished like this:
```lua
my_timer:is_finished()
```


