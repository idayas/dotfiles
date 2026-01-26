require "mason".setup()
require "mason-lspconfig".setup({automatic_installation = true})
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
