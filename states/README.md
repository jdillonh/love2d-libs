
# states.lua
This is a state machine library. It's very simple, each state machine object has a **load**, **update**, and **draw** function, just like the `love.load`, `love.update`, `love.draw` functions.  
Each state machine object also has a **exit** function, which is called when that state is left.

## Creating new state machines
```lua 
s = states.new(l, u, d, [e])
current_state = s
```  
__l__: load function, called when switching to this state.  
__u__: update function, called every cycle in `love.update`.    
__d__: draw function, called every frame in `love.draw`.  
__e__: optional exit function, called when leaving this state.  

## Switching states
```lua
s2 = states.new( ... )
the_state = s:switch_to(s2)  
  
--in love.update   
  
the_state.update()  
  
--in love.draw  
  
the_state.draw()
```

Call the `current_state:switch_to(new_state)` method to automatically call `current_state.exit` and `new_state.load`. This method returns the new state, (the one passed in), so you can set a state varialbe.
