local ts = require('nvim-treesitter')

ts.install({'html', 'javascript', 'go', 'lua', 'php'})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    pcall(vim.treesitter.start)

    local lang = vim.bo[args.buf].filetype

    if lang == 'php' then
      -- Nuke Neovim's default PHP indent rules for this buffer
      vim.bo[args.buf].indentexpr = ""
      vim.bo[args.buf].smartindent = false
      vim.bo[args.buf].cindent = false
      vim.bo[args.buf].autoindent = true
      vim.bo[args.buf].indentkeys = "" -- Stops weird jumps when typing braces/brackets
    else
      -- Use Treesitter indentation for everything else
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

