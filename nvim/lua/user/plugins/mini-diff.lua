require "mini.diff".setup({
  view = {
    style = 'sign',
    signs = { add = '┃', change = '┃', delete = '_' }
  },
  delay = {
    text_change = 100
  }
})
