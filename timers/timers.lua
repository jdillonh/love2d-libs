local timers = {}

--holds all the timer objects
timers.all = {}

timers.meta = {
  __index = timers,
  __tostring = 
  function(self)
    s = "Timer object:\n"
    s = s.."Duration = "..self.duration..'\n'
    s = s.."Time left = "..self.time_left..'\n'
    s = s.."In global table = "..
    (self.keep_track and "True" or "False") 
    return s
  end,
}

function timers.new(duration, on_completion, keep_track)
  newbie = {
    duration = duration,
    time_left = duration,
    keep_track = keep_track or false,
    on_completion = on_completion
  }
  setmetatable(newbie, timers.meta)
  if keep_track then 
    table.insert(timers.all, newbie) 
  end
  return newbie
end

function timers:update(dt)
  if not dt then error("timers:update requires dt") end
  self.time_left = self.time_left - dt
  if self.time_left <= 0 then
    if self.on_completion then
      self.on_completion()
    end
    return true
  else
    return false
  end
end

function timers:is_finished()
  if self.time_left <= 0 then
    return true
  else 
    return false
  end
end

function timers:restart()
  self.time_left = self.duration
end

function timers.update_all(dt)
  for i,t in pairs(timers.all) do
    if t:update(dt) then
      table.remove(timers.all,i)
    end
  end
end

return timers

