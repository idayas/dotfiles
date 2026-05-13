local ts = require('nvim-treesitter')

ts.install({'html', 'javascript', 'go', 'lua', 'php'})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    pcall(vim.treesitter.start)

    local lang = vim.bo[args.buf].filetype

    -- Use simple, reliable auto-indent for all file types
    -- This approach works consistently and avoids problematic treesitter indentation
    vim.bo[args.buf].indentexpr = ""
    vim.bo[args.buf].smartindent = false
    vim.bo[args.buf].cindent = false
    vim.bo[args.buf].autoindent = true
    vim.bo[args.buf].indentkeys = "" -- Stops weird jumps when typing braces/brackets
  end,
})

