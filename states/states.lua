
states = {}

states.meta = {
  __index = states,
  __tostring = function()
    return "state machine object"
  end
}


--[[
state machine object constructor
:l: load function, to be called when changing to this state.
:u: update function, to be called every frame.
:d: draw function, to be called ever frame when allowed, after update.
:e: exit function, to be called when switching to a new state.
:returns: the new state machine object
]]
function states.new(l, u, d, e)
  local new = {}
    new.load = l or function() end
    new.update = u or function() end
    new.draw = d or function() end
    new.exit = e or function() end
  return new
end


--[[
Attempts to call the old table's (self's) exit function, 
then attempts to call new state's 'load' function, then returns the new state.
:s: the new state's state machine object
:returns: the new state's state machine object, (same as input)
]]
function states:switch_to(s)
  if self and self.exit then self.exit() end
  if s.load then s.load() end
  return s
end


return states
