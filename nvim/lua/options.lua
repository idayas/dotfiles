require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt

-- Prevent line wrapping 
opt.wrap = false

-- Enable relative line numbers
opt.relativenumber = true

-- complete the longest common match, and allow tabbing the results to fully complete them
opt.wildmode = "longest:full,full"

-- Scroll offset (how many lines / characters of padding basically when scrolling)
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Ask for confirmation instead of erroring when quitting without saving
-- opt.confirm = true
