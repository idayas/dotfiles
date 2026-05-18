-- Use 4 spaces for Go files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function(args)
    vim.bo[args.buf].tabstop = 4
    vim.bo[args.buf].shiftwidth = 4
    vim.bo[args.buf].softtabstop = 4
  end,
})
