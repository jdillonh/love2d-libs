
```lua
local timers = require "timers.lua"
```

# timers.lua
timers.lua allows you to create timer objects to keep track of time-based events.

## Creating new timer objects

```lua
my_timer = timers.new( duration, [on_completion], [add_to_global_table] )
```
__duration__ is the length of the timer.  
__on_completion__ is a function that will be called once the timer is completed. Default: nil.  
__add_to_global_table__ is a boolean value that will add this timer to the global `timer.all` table. See  [TODO add link](). Default: false.

## Updating timers
Calling _timer.update_all(dt)_ will automatically update all of the timers in the global table, and automatically delete them when they are finished.
