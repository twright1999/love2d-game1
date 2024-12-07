----------------------------------------------
-- Project: game1
-- File: main.lua
-- Author: Tom Wright
-- Description: Main game loop
----------------------------------------------

------------------------------------
-- Runs every frame, draw the screen
function love.draw()
    local width, height = love.graphics.getDimensions()

    love.graphics.print("Hello World", width/2, height/2)
end
