
# states.lua
This is a state machine library. It's very simple, each state machine object has a **load**, **update**, and **draw** function, just like the `love.load`, `love.update`, `love.draw` functions.  
Each state machine object also has a **exit** function, which is called when that state is left.

## Creating new state machines
`states.new(l, u, d, [e])`  
__l__: load function, called when switching to this state.  
__u__: update function, called every cycle in `love.update`.    
__d__: draw function, called every frame in `love.draw`.  
__e__: optional exit function, called when leaving this state.  
