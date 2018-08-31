--[[TODO
--
--  Add global tables for updating and drawing,
--  
--  Add :set_speed etc. methods
--]]



local anim = {}

anim.meta = {
  __index = function(self, index)
    local anim_index = anim[index]
    if not anim_index then
      error("no such feild "..index)
    end
    return anim_index
  end,
  
  __newindex = function(self, key, value)
    error("Attempted to add field "..key.." = "..value)
  end,

  __tostring = function(self)
    s = "animation object: \n"
    for i,v in pairs(self) do
      s = s .. i .. " = " .. tostring(v) .. "\n"
    end
    return s
  end,
}


--[[
  anim.new() creates a new animation object
  :path: string, path to the sprite sheet, a lateral strip of frames
  :n_of_frames: number, number of frames in the animation
  :frame_delay: number, the time in seconds that each frame lasts
  :x: number, x-coordinate
  :y: number, y-coordinate
  :sx: number, x direction scale factor
  :sy: number, y direction scale factor
  :rot: number, rotation in radians
  :add_to_table: WIP - bool, add to global table of animations?
]]
function anim.new(path,n_of_frames,frame_delay,x,y,sx,sy,rot, add_to_table)
  local new = {}    
  new.x, new.y = x, y 
  new.frame_delay = frame_delay
  
  --how long the current frame has been active
  new.current_frame_time = 0
  new.current_frame = 0
  new.scale_x, new.scale_y = sx or 1, sy or 1
  new.rotation = rot or 0
  new.sprite_sheet = love.graphics.newImage(path)

  --new.frames holds all the quads for each frame
  new.frames = {}

  local iw, ih = new.sprite_sheet:getDimensions()
  local fw, fh = iw/n_of_frames, ih
  for i=0, n_of_frames do
    new.frames[i] = love.graphics.newQuad(i*fw, 0, fw, fh, iw, ih )
  end

  new.length = n_of_frames
  setmetatable(new, anim.meta)
  return new
end


--[[
    anim:update() - updates the animation, must be called on each animation
      every frame
    :dt: number, optional dt value from love.update(dt)
    :x: number, new x-position of the animation object
    :y: number, new y-position of the animation object
    
    if dt is not provided then frame_delay will be counted as a 
    number of update cycles rather than a number of seconds
]]
function anim:update(dt, x, y)
  if not self then error("method called on nil") end
  if x then self.x = x end
  if y then self.y = y end
  
  --this allows users to set the frame rate to be a number of
  --frames rather than a number of seconds.
  if not dt then 
    dt = 1 
  end

  --update how long this frame has been showing.
  self.current_frame_time = dt + self.current_frame_time

  --this allows frames to be skipped when the game lags.
  while self.current_frame_time > self.frame_delay do
    self.current_frame_time = (- self.frame_delay) + self.current_frame_time
    --increment frame and make up for Lua 1-indexing
    self.current_frame = (1 + self.current_frame) % self.length
  end
end


--[[
    anim:draw() - draws the animation to the screen
]]
function anim:draw()
  if not self then error("method called on nil") end
  love.graphics.draw(self.sprite_sheet, self.frames[self.current_frame], 
                     self.x, self.y, self.rotation, self.scale_x,self.scale_y) 
end




return anim
