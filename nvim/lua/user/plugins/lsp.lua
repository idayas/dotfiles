require "mason".setup()
require "mason-lspconfig".setup({automatic_installation = true})
-- LSPs (Autocomplete currently off by default, use <C-x><C-o>)
require "mason-tool-installer".setup({
  ensure_installed = {
    "lua_ls", "docker_language_server", "tailwindcss",
    "ts_ls", "intelephense", "gopls", "eslint"
  }
})
