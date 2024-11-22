return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	dependencies = {
      "EmranMR/tree-sitter-blade"
    },
    opts = {
  		ensure_installed = {
  		 "vim", "lua", "vimdoc", "blade",
       "html", "css", "php", "rust",
        "javascript", "typescript"
  		},
      highlight = {
        enable = true,
      },
  	},
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      require("configs.custom.treesitter")
    end,
  },
}
