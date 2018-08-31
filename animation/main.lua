--a love project to test the animation library

local anim = require "animation"

love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
  --                 path    #frames,delay,x,y,sx,sy,rot,
  numbers = anim.new("one.png", 8, 0.2, 10, 10, 10,10,0)
end


function love.update(dt)

  numbers:update(dt, 100,100)

end


function love.draw()
  love.graphics.clear(0.5,0.5,0.5)
  numbers:draw()
  love.graphics.draw(numbers.sprite_sheet)
  love.graphics.translate(100,100)
  love.graphics.draw(numbers.sprite_sheet, numbers.frames[2])
end
