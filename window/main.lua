local window = require("window")

function bg()
  love.graphics.setColor(0,1,1)
  for i = 1, 100 do
    local x,y = love.math.random(1,1699), love.math.random(2,900)
    love.graphics.circle("fill",x,y,100)
  end
end

-- 320 x 240

function love.load()
  love.graphics.setDefaultFilter( "nearest", "nearest")
  window.setup(280 , 192 , 750, 750, 
                    {resizable = true}, nil, nil) 
end


function love.update(dt)

end



function love.draw()
  window:start_draw()
  
  love.graphics.clear(0.3, 0.7 ,1)
  love.graphics.circle("fill",64,64,10)
  window:end_draw()
end
