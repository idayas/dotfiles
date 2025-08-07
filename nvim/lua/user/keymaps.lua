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

map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')  -- Go to previous file

map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>') -- Split find
map({ 'n' }, '<leader>\\', ':vsplit<CR>')        -- Open new vsplit
