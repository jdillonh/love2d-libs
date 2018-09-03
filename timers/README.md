
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
__on_completion__ function, will be called once the timer is completed. Default: nil.  
__add_to_global_table__ boolean, add this timer to the global `timer.all` table. See  [below](https://github.com/jdillonh/love2d-libs/blob/master/timers/README.md#updating-timers). Default: false.

## Updating timers
`timer.update_all(dt)` will automatically update all of the timers in the global `timer.all` table, and automatically delete them when they are finished.  
Otherwise use:  
```lua 
my_timer:update(dt)
```
__dt__: delta timer  
  
_Do not call :update(dt) on a function that has been added to the global table. It will finish in half it's duration._  
