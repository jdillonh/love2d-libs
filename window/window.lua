--TODO add mouse_adjust_x and y functions!!!!!!!!!!




local window = {}

--[[
:resx, resy: x and y res of the game
:sizex, sizey: size of the window
:[table]: table to pass into love.window.setMode
:[background_color]: color of the bars, default black
:[draw_to_background]: function with instructions to draw to the background of the window
]]
function window.setup(resx,resy,sizex,sizey,table,background_color,draw_to_background)
  window.game_res_x = resx
  window.game_res_y = resy
  window.game_ar = resx / resy
  window.game_canvas = love.graphics.newCanvas(resx, resy)
    
  window.size_x = sizex
  window.size_y = sizey

  love.window.setMode(sizex,sizey, table or {})

  window.background_color = background_color or {0,0,0}
  window.draw_to_background = draw_to_background or nil 

  window.scale_factor = 0
  window.border_size_x = 0
  window.border_size_y = 0
end


function window.start_draw()
  love.graphics.clear(window.background_color)
  if window.draw_to_background then
    window.draw_to_background()
  end
  love.graphics.setCanvas(window.game_canvas)
end

--draw game here ~~

function window.end_draw()

  love.graphics.setCanvas()

  local win_w, win_h = love.graphics.getDimensions()
  local win_ar = win_w / win_h
  
  --if window is too wide
  if win_ar >= window.game_ar then
    --game height needs to be scaled up to win_h, width scaled by same factor
    local scale_factor = win_h / window.game_res_y 
    local border_size = (win_w - (window.game_res_x * scale_factor)) / 2
    window.scale_factor = scale_factor
    window.border_size_x = border_size 
    window.border_size_y = 0
    love.graphics.draw(window.game_canvas, border_size , 0,0, scale_factor, scale_factor)   

  --if window if too tall
  else 
    local scale_factor = win_w / window.game_res_x
    local border_size = (win_h - (window.game_res_y * scale_factor)) / 2
    window.scale_factor = scale_factor
    window.border_size_y = border_size
    window.border_size_x = 0
    love.graphics.draw(window.game_canvas, 0, border_size, 0, scale_factor, scale_factor)
  
  end
end


function window.mouse_x()
  return (love.mouse.getX()/ window.scale_factor) -
          (window.border_size_x / window.scale_factor)
end


function window.mouse_y()
  return (love.mouse.getY()/ window.scale_factor) -
          (window.border_size_y / window.scale_factor)
end



return window 
