----------------------------------------------
-- Project: game1
-- File: main.lua
-- Author: Tom Wright, Oliver Wright
-- Description: Main game loop
----------------------------------------------

--------------------------------------------
-- Loads assets at the beginning of the game
function love.load()
    ball = love.graphics.newImage("images/ball.png")
    x = 200
    y = 200
end

------------------------------------
-- Runs every frame, draw the screen
function love.draw()
    local width, height = love.graphics.getDimensions()

    love.graphics.print("Hello World", width/2, height/2)
    love.graphics.draw(ball, x, y)
end
