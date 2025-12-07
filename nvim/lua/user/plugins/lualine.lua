require "lualine".setup({
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      'branch',
      'diff',
      -- {'diagnostics', sources = {'nvim_diagnostic'}}
    },
    lualine_c = {
      'filename',
    },
    lualine_x = {
      'filetype',
      -- 'encoding',
      -- 'fileformat',
    },
    lualine_y = {
      'location',
    },
    lualine_z = {
      'progress',
    }
  }
})

