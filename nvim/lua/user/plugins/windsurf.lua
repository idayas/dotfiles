-- Disable default Tab binding
vim.g.codeium_no_map_tab = true
vim.g.codeium_enabled = true

-- Smart Tab: Prioritize blink.cmp menu, then AI, then normal Tab
vim.keymap.set('i', '<Tab>', function()
  local blink = require('blink.cmp')

  -- If blink menu is visible, navigate it
  if blink.is_visible() then
    blink.select_next()
    return ''
  end

  -- Otherwise, try to accept AI suggestion
  if vim.fn['codeium#GetStatusString']() ~= '' then
    return vim.fn['codeium#Accept']()
  end

  -- Fallback to normal Tab
  return vim.api.nvim_replace_termcodes('<Tab>', true, false, true)
end, { expr = true, silent = true })

-- Alt/Opt+Enter always accepts AI (no menu checks)
vim.keymap.set('i', '<M-CR>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })

-- Other AI keybindings
vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<M-w>', function() return vim.fn['codeium#AcceptNextWord']() end, { expr = true, silent = true })
vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#AcceptNextLine']() end, { expr = true, silent = true })
vim.keymap.set('i', '<M-e>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
