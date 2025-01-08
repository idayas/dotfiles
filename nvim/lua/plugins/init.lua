return {
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
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.custom.which-key")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettierd",
        "typescript-language-server",
        "tailwindcss-language-server",
      }
    }
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- Add more languages
  { "sheerun/vim-polyglot" },

  -- Enable * searching with visually selected text
  { "nelstrom/vim-visual-star-search" },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {}  -- leaving empty since we want default behavior
      })
    end,
  },

  -- Allows for gS to split or gJ to join lines
  {
    "AndrewRadev/splitjoin.vim",
    event = "VeryLazy",
  },

  -- Fix indentation when pasting
  {
    "ku1ik/vim-pasta",
    event = "VeryLazy",
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.custom.null-ls"
    end,
  },
  {
  "hrsh7th/nvim-cmp",
  opts = function()
    require "configs.custom.cmp"
  end,
  }
}

