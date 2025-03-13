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

-- Set up intelephense separately with priority
lspconfig.phpactor.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  priority = 100, -- High priority for PHP
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
    ["language_server.diagnostics.enabled"] = true,
    ["language_server.diagnostics.php.enabled"] = true,
    -- Hide most warnings regarding missing type declarations
    ["language_server.diagnostics.php.phpDocMissingReturn"] = false,
    ["language_server.diagnostics.php.missingReturnType"] = false,
    ["language_server.diagnostics.php.missingType"] = false,
    ["language_server.diagnostics.php.missingVisibility"] = false,
    ["language_server.diagnostics.php.isMixed"] = false,
    ["language_server.diagnostics.php.deprecatedType"] = false,
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
