----------------------------------------------
-- Project: game1
-- File: main.lua
-- Author: Tom Wright, Oliver Wright
-- Description: Main game loop
----------------------------------------------

--------------------------------------------
-- Loads assets at the beginning of the game
function love.load()
    love.physics.setMeter(64)  -- Sets a meter to 64 pixels
    world = love.physics.newWorld(0,9.81*64, true) -- Creates the world which is the physics enviroment
-- Creates objects for the enviroment
    objects = {}

    objects.ground = {}
    objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2)
    objects.ground.shape = love.physics.newRectangleShape(650, 50)
    objects.ground.fixture = love.physics.newFixture(objects.ground.body,objects.ground.shape)

    objects.ball = {}
    objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic")
    objects.ball.shape = love.physics.newCircleShape(20)
    objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1)
    objects.ball.fixture:setRestitution(0.9)

-- Sets background colour and window size

    love.graphics.setBackgroundColor(0.41, 0.53, 0.97)
    love.window.setMode(650, 650)

    dragging = false
end

------------------------------------------------------------------
-- Called continuously during game loop, updates state of the game

function love.update(dt)
    world:update(dt)

    -- If the ball is being dragged sets ball position to mouse position

    if dragging then
        local mx, my = love.mouse.getPosition()
        objects.ball.body:setPosition(mx, my)
    end

end

    -- Detect when mouse is pressed

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        -- Gets the position when the ball is grabbed
        startX, startY = love.mouse.getPosition()
        -- Check if the mouse is over the ball
        local ballX, ballY = objects.ball.body:getPosition()
        local ballRadius = objects.ball.shape:getRadius()

        local dx = startX - ballX
        local dy = startY - ballY
        local distance = math.sqrt(dx * dx + dy * dy)

        if distance <= ballRadius then
            dragging = true

        end

    end

end
    -- Detect when mouse is releaced
function love.mousereleased(x, y, button, istouch, presses)

    if button == 1 then
        dragging = false
        --Gets the position when the mouse is releaced
        local endX, endY = love.mouse.getPosition()
        -- Calculate the vector from start to end of the drag
        local dirX = endX - startX
        local dirY = endY - startY
        -- Notmalize direction and apply forse to the ball
        local length = math.sqrt(dirX * dirX + dirY * dirY)
        if length > 0 then

            dirX = dirX / length
            dirY = dirY / length
            -- Apply linear inpulse to the ball
            objects.ball.body:applyLinearImpulse(dirX * 50, dirY * 50)

        end

    end

end
-------------------
-- Draw the objects
function love.draw()
    
    love.graphics.setColor(0.28, 0.63, 0.05)
    love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))

    love.graphics.setColor(0.76, 0.18, 0.05)
    love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())

end
