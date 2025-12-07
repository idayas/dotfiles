require "nvim-treesitter.install".update({ with_sync = true })
require "nvim-treesitter.configs".setup({
  ensure_installed = 'all',
  ignore_install = { -- Prevents it from trying to extract archives that don't exist
    "ipkg"
  },
  highlight = { enable = true },
  indent = { enable = true },
})
