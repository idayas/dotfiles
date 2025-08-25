local map = vim.keymap.set

-- Plugins
vim.pack.add({
  { src = "https://github.com/catppuccin/nvim" },                    -- Theme
  { src = "https://github.com/stevearc/oil.nvim" },                  -- File Browser
  { src = "https://github.com/echasnovski/mini.pick" },              -- Quick picker for files
  { src = "https://github.com/echasnovski/mini.diff" },              -- For seeing git differences
  { src = "https://github.com/mason-org/mason.nvim" },               -- Keeping this for easy lsp installations and management
  { src = 'https://github.com/neovim/nvim-lspconfig' },              -- Used for acutally running lsps
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },    -- Formatter
  { src = "https://github.com/windwp/nvim-autopairs" },              -- Auto adds matching brackets, quotes, etc
  { src = "https://github.com/windwp/nvim-ts-autotag" },             -- Adds auto matching tags form HTML
  { src = "https://github.com/brenoprata10/nvim-highlight-colors" }, -- Color code highlighting, ex #00FF00
  { src = "https://github.com/folke/todo-comments.nvim" },           -- Todo comment formatting, ex  TODO:
})

-- Plugin setup

local diff = require "mini.diff"
local highlight = require "nvim-highlight-colors"
local oil = require "oil"
local todo = require "todo-comments"
local ts_configs = require "nvim-treesitter.configs"
local pick = require "mini.pick"

diff.setup({
  view = {
    style = 'sign',
    signs = { add = '┃', change = '┃', delete = '_' }
  },
  delay = {
    text_change = 100
  }
})

highlight.setup({
  render = 'virtual',
  virtual_symbol = '■',
  virtual_symbol_prex = '',
  virtual_symbol_suffix = ' ',
  virtual_symbol_position = 'inline',
  enable_tailwind = true,
})

ts_configs.setup({
  ensure_installed = { "blade", "php", "typescript", "javascript", "css", "html", "go", "c", "python", "sql" },
  highlight = { enable = true },
  indent = { enable = true }
})

local simple_plugins = { "mini.pick", "mason", "nvim-autopairs", "nvim-ts-autotag", "oil" }
for _, plugin in ipairs(simple_plugins) do
  require(plugin).setup()
end


-- LSPs (Autocomplete currently off by default, use <C-x><C-o>)
vim.lsp.enable({ "lua_ls", "intelephense", "tailwindcss", "eslint", "gopls", "docker_language_server", "ts_ls" })

-- Theme
vim.cmd("colorscheme catppuccin")

-- Plugin Keymaps
map('n', '<leader>fo', pick.builtin.files, {desc = "Search files in current path"})
map('n', '<leader>fg', pick.builtin.grep_live, {desc = "Search with live grep"})
map('n', '<leader>oh', pick.builtin.help, {desc = "Search help docs"})
map('n', '<leader>oo', pick.builtin.buffers, { desc = "Search open buffers"})
map('n', '<leader>ff', vim.lsp.buf.format, { desc = "Format Current File" })
map('n', '<leader>e', oil.open, { desc = "Open File Explorer (Oil)" })
map({ 'n' }, '<leader>/', "gcc", { remap = true, desc = "Comment Toggle" })
map({ 'v', 'x' }, '<leader>/', "gc", { remap = true, desc = "Comment Toggle for Multiline" })
map('n', '<leader>up', vim.pack.update, { desc = "Update plugins" })
map('n', ']t', todo.jump_next, { desc = "Next todo comment" })
map('n', '[t', todo.jump_prev, { desc = "Previous todo comment" })


-- LSPs
map('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>') -- Floating diagnostic window
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')         -- Go to previous diagnostic
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')         -- Go to previous diagnostic
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')           -- Go to definition
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')                 -- Hover help
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')       -- Rename hovered element
