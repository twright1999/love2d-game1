----------------------------------------------
-- Project: game1
-- File: conf.lua
-- Author: Tom Wright
-- Description: Configuration for the project
----------------------------------------------

-------------------------------------------------------------------------------
-- Runs before the LÖVE modules are loaded.
-- Takes one argument: a table filled with all the default values which you can
-- overwrite to your liking.
function love.conf(t)
    t.title = "game1"
    t.window.width = 800
    t.window.height = 600
    t.console = true
end