local opt = vim.opt

opt.number = true         -- Show line numbers
opt.relativenumber = true -- Use relative line numbers
opt.signcolumn = "yes"    -- Makes sure the sign column always shows instead of toggling

opt.expandtab = true      -- Use spaces instead of tab
opt.wrap = false          -- Prevents text from wrapping
opt.tabstop = 2           -- Set size of tab
opt.shiftwidth = 2        -- Set number of spaces for:indents
opt.softtabstop = 2       -- Multiple to use when hitting tab (ex if set to 2 and on 61, only tabs to 62 instead of tabbing 2 to 63)

opt.swapfile = false      -- Disables swap files
opt.winborder = "rounded" -- Make the window border type rounded
opt.ignorecase = true     -- Makes searches case-insensitive by default
opt.undofile = true       -- Persist undo history between sessions
opt.smartcase = true      -- If case is used in search, change from case insensitive
opt.termguicolors = true  -- Uses full terminal color range

opt.wildmode =
'longest:full,full'                 -- Tab completions go to longest common match and allows tabbing to fully complete results
opt.mouse = 'a'                     -- Enable mouse for all modes

opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
opt.splitbelow = true               -- Default new hsplits to create below
opt.splitright = true               -- Defaults new vsplits to create right

opt.scrolloff = 6                   -- Vertical scroll offset
opt.sidescrolloff = 6               -- Horizontal scroll offset

opt.confirm = true -- ask for confirmation instead of erroring when quitting after making changes

opt.clipboard = 'unnamedplus'       -- Set system clipboard
-- opt.smartindent = true              -- Disabled because treesitter, keeping as ref

vim.cmd("colorscheme catppuccin") -- Set colorscheme
