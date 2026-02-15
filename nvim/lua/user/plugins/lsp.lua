require "mason".setup()
require "mason-lspconfig".setup({
  automatic_installation = true,
  handlers = {
    function(server_name)
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local config = {
        capabilities = capabilities
      }

      if server_name == "html" then
        config.init_options = {
          provideFormatter = true,
          embeddedLanguages = { css = true, javascript = true },
          configurationSection = { "html", "css", "javascript" }
        }
        config.settings = {
          html = {
            autoClosingTags = false,
          }
        }
      end

      require('lspconfig')[server_name].setup(config)
    end,
  }
})

-- LSPs (Autocomplete currently off by default, use <C-x><C-o>)
require "mason-tool-installer".setup({
  ensure_installed = {
    "lua_ls", "docker_language_server", "tailwindcss",
    "ts_ls", "intelephense", "gopls", "eslint"
  }
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc= "Open Code Action Dialog" })
  end,
})
