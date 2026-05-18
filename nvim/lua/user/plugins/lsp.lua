local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config('*', {
  capabilities = capabilities,
})

vim.lsp.config('html', {
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { "html", "css", "javascript" }
  },
  settings = {
    html = {
      autoClosingTags = false,
    }
  }
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
})

require "mason".setup()
require "mason-lspconfig".setup()

-- LSPs (Autocomplete currently off by default, use <C-x><C-o>)
require "mason-tool-installer".setup({
  ensure_installed = {
    "lua_ls", "docker_language_server", "tailwindcss",
    "ts_ls", "intelephense", "gopls", "eslint", "terraform-ls", "rumdl"
  }
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc= "Open Code Action Dialog" })
  end,
})
