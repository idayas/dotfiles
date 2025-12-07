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
  { src = "https://github.com/tpope/vim-surround" },                 -- Allows for quickly editing various surroundings, ex "", '', (), {}
  { src = "https://github.com/folke/todo-comments.nvim" },           -- Todo comment formatting, ex  TODO:
})

-- Plugin setup
local simple_plugins = { "mini.pick", "mason", "nvim-autopairs", "nvim-ts-autotag", "oil", "todo-comments" }
for _, plugin in ipairs(simple_plugins) do
  require(plugin).setup()
end


require "mini.diff".setup({
  view = {
    style = 'sign',
    signs = { add = '┃', change = '┃', delete = '_' }
  },
  delay = {
    text_change = 100
  }
})

require "nvim-highlight-colors".setup({
  render = 'virtual',
  virtual_symbol = '■',
  virtual_symbol_prex = '',
  virtual_symbol_suffix = ' ',
  virtual_symbol_position = 'inline',
  enable_tailwind = true,
})

require "nvim-treesitter.configs".setup({
  ensure_installed = { "blade", "php", "typescript", "javascript", "css", "html", "go", "c", "python", "sql" },
  highlight = { enable = true },
  indent = { enable = true }
})

-- LSPs (Autocomplete currently off by default, use <C-x><C-o>)
vim.lsp.enable({
  "lua_ls", "intelephense", "tailwindcss", "eslint",
  "gopls", "docker_language_server", "ts_ls", "typescript-language-server",
  "laravel_ls"
})
