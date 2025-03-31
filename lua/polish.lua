-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Modifies when CR will trigger using autocompletion
-- (helpful to prevent accidentally accepting common suggestions)
vim.o.completeopt = "menu,menuone"
