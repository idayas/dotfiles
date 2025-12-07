local map = vim.keymap.set
vim.g.mapleader = " " -- Set leader to spacebar

-- When text is wrapped, moved by terminal row instead of line (unless count given)
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection afer indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

map('v', 'y', 'myy`y')                   -- Maintain the cursor position after yanking in visual mode
map('v', 'p', '"_dP')                    -- Paste replace visual selection without copying it
map('n', '<Leader>k', ':nohlsearch<CR>') -- Clear selected text

-- Move lines up and down when holding alt
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")

map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>') -- Go to previous file
map('n', '<leader>\\', vim.cmd.vsplit, { desc = "Open new vertical '|' split" })
map('n', '<leader>x', vim.cmd.bdelete, { desc = "Close open buffer" })


-- Plugin Keymaps
local oil = require "oil"
local todo = require "todo-comments"
local pick = require "mini.pick"
local git = require "mini.diff"

map('n', '<leader>fo', pick.builtin.files, { desc = "Search files in current path" })
map('n', '<leader>fg', pick.builtin.grep_live, { desc = "Search with live grep" })
map('n', '<leader>oh', pick.builtin.help, { desc = "Search help docs" })
map('n', '<leader>oo', pick.builtin.buffers, { desc = "Search open buffers" })
map('n', '<leader>ff', vim.lsp.buf.format, { desc = "Format Current File" })
map('n', '<leader>e', oil.open, { desc = "Open File Explorer (Oil)" })
map({ 'n' }, '<leader>/', "gcc", { remap = true, desc = "Comment Toggle" })
map({ 'v', 'x' }, '<leader>/', "gc", { remap = true, desc = "Comment Toggle for Multiline" })
map('n', '<leader>up', vim.pack.update, { desc = "Update plugins" })
map('n', ']t', todo.jump_next, { desc = "Next todo comment" })
map('n', '[t', todo.jump_prev, { desc = "Previous todo comment" })
map('n', '<leader>gd', git.toggle_overlay, {desc = "Toggle git diff overlay"})

map('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename hovered element" })
-- LSPs
map('n', '<leader>d', vim.diagnostic.open_float, { desc = "Open floating diagnostic window" })
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
map('n', 'K', vim.lsp.buf.hover, { desc = "Display hover help" })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename hovered element" })
