-- Plugins
vim.pack.add({
  -- Interface
  "https://github.com/catppuccin/nvim",                    -- Theme
  "https://github.com/nvim-treesitter/nvim-treesitter",    -- Formatter
  "https://github.com/windwp/nvim-autopairs",              -- Auto adds matching brackets, quotes, etc
  "https://github.com/brenoprata10/nvim-highlight-colors", -- Color code highlighting, ex #00FF00
  "https://github.com/echasnovski/mini.diff",              -- For seeing git differences
  "https://github.com/nvim-lualine/lualine.nvim",          -- Add custom status line at bottom of nvim

  -- Quality of Life
  "https://github.com/JoosepAlviste/nvim-ts-context-commentstring", -- Should in theory allow for context away commenting
  "https://github.com/tpope/vim-surround",                          -- Allows for quickly editing various surroundings, ex "", '', (), {}
  "https://github.com/windwp/nvim-ts-autotag",                      -- Adds auto matching tags form HTML
  "https://github.com/folke/todo-comments.nvim",                    -- Todo comment formatting, ex  TODO:

  -- Navigation
  "https://github.com/stevearc/oil.nvim",     -- File Browser
  "https://github.com/echasnovski/mini.pick", -- Quick picker for files

  -- LSP
  "https://github.com/neovim/nvim-lspconfig",                     -- Used for acutally running lsps
  "https://github.com/mason-org/mason.nvim",                      -- Keeping this for easy lsp installations and management
  "https://github.com/mason-org/mason-lspconfig.nvim",            -- Automatically enables all mason installed plugins
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", -- Allows you to ensure install for mason
})

-- Plugin setup
local simple_plugins = {
  "ts_context_commentstring", "mini.pick", "nvim-autopairs",
  "nvim-ts-autotag", "oil", "todo-comments"
}

for _, plugin in ipairs(simple_plugins) do
  require(plugin).setup()
end

-- Plugins with custom setup files
require "user.plugins.lsp"
require "user.plugins.lualine"
require "user.plugins.mini-diff"
require "user.plugins.nvim-highlight"
require "user.plugins.treesitter"
