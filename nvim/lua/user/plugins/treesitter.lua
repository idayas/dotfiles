local ts = require('nvim-treesitter')

ts.install({'html', 'javascript', 'go', 'lua', 'php'})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
