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
  "ts_ls"
}
local nvlsp = require "nvchad.configs.lspconfig"

-- Set up intelephense separately with priority
lspconfig.intelephense.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  priority = 100,  -- High priority for PHP
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
