local map = vim.keymap.set

-- Plugins
vim.pack.add({
  { src = "https://github.com/catppuccin/nvim" },                    -- Theme
  { src = "https://github.com/stevearc/oil.nvim" },                  -- File Browser
  { src = "https://github.com/echasnovski/mini.pick" },              -- Quick picker for files
  { src = "https://github.com/echasnovski/mini.diff" },              -- For seeing git differences 
  { src = "https://github.com/mason-org/mason.nvim" },               -- Keeping this for easy lsp installations and management
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },    -- Formatter
  { src = "https://github.com/windwp/nvim-autopairs" },              -- Auto adds matching brackets, quotes, etc
  { src = "https://github.com/windwp/nvim-ts-autotag" },             -- Adds auto matching tags form HTML
  { src = "https://github.com/brenoprata10/nvim-highlight-colors" }, -- Color code highlighting, ex #00FF00
})

require "oil".setup()
require "mini.pick".setup()
require "mini.diff".setup({
  view = { 
    style = 'sign', 
    signs = { add = '┃', change = '┃', delete = '_' }
  },
  delay = {
    text_change = 100
  }
})
require "mason".setup()
require "nvim-autopairs".setup()
require "nvim-ts-autotag".setup()

require "nvim-highlight-colors".setup({
  render = 'virtual',
  virtual_symbol = '■',
  virtual_symbol_prex = '',
  virtual_symbol_suffix = ' ',
  virtual_symbol_position = 'inline',
  enable_tailwind = true,
})
require "nvim-treesitter.configs".setup({
  ensure_installed = { "blade", "php", "typescript", "javascript", "css", "html" },
  highlight = { enable = true },
  indent = { enable = true }
})

map('n', '<leader>fo', ":Pick files<CR>")              -- File Open
map('n', '<leader>fg', ":Pick grep_live<CR>")          -- File Grep
map('n', '<leader>oh', ":Pick help<CR>")               -- Open Help
map('n', '<leader>oo', ":Pick buffers<CR>")            -- Open open buffers
map('n', '<leader>ff', vim.lsp.buf.format)             -- Format File
map('n', '<leader>e', ":Oil<CR>")                      -- Explore
map({ 'n' }, '<leader>/', "gcc", { remap = true })     -- Comment Toggle
map({ 'v', 'x' }, '<leader>/', "gc", { remap = true }) -- Comment Toggle
map('n', '<leader>up', ':lua vim.pack.update()<CR>')   -- Update plugins

-- LSP
vim.lsp.enable({ "lua_ls", "phpactor", "laravel_ls" })
-- Autocomplete currently off by default, use <C-x><C-o>

-- Theme
vim.cmd("colorscheme catppuccin")
