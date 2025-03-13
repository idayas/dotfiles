require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local functions = require "functions"
vim.api.nvim_create_user_command("DiagCodes", functions.show_diagnostic_codes, {})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Maintain cursor position when yanking
-- map('v', 'y', 'myy`y')

-- Disable command line typo
map("n", "q:", ":q")

-- Paste replace visual selection without copying it
map("v", "p", '"_dP')

-- Easy insertion of trailing ; or , from insert mode.
-- map('i', ';;', '<Esc>A;');
-- map('i', ',,', '<Esc>A,');

-- Move lines up and down with alt
map("i", "<A-j>", "<Esc>:move .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:move .-2<CR>==gi")
map("n", "<A-j>", ":move .+1<CR>==")
map("n", "<A-k>", ":move .-2<CR>==")
map("v", "<A-j>", ":move '>+1<CR>gv=gv")
map("v", "<A-k>", ":move '<-2<CR>gv=gv")
