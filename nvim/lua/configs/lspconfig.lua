-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"
-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "emmet_ls",
  "dockerls",
  "lua_ls",
  "eslint",
  "gopls",
  "ts_ls",
}
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.phpactor.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  priority = 100, -- High priority for PHP
  init_options = {
    ["language_server.diagnostics_on_update"] = false,
    ["language_server.diagnostics_on_open"] = false,
    ["language_server.diagnostics_on_save"] = false,
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
    ["language_server.diagnostic_ignore_codes"] = {"missing_return_type"}
  },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
