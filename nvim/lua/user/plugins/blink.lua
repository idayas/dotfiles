require('blink.cmp').setup({
  keymap = {
    preset = 'default',
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'hide' },
    ['<CR>'] = { 'accept', 'fallback' },

    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
  },
  appearance = {
    nerd_font_variant = 'mono'
  },

  completion = {
    menu = {
      auto_show = true,
    },
  },

  sources = {
    -- specific modules you want enabled
    default = { 'lsp', 'path', 'snippets', 'buffer' },

    transform_items = function(ctx, items)
      -- Get the current buffer's filetype
      local ft = vim.bo[ctx.bufnr].filetype

      -- Only filter for HTML-like languages to avoid affecting code in other files
      if ft == 'html' or ft == 'xml' or ft == 'vue' or ft == 'svelte' or ft == 'eruby' or ft == 'php' then
        return vim.tbl_filter(function(item)
          -- Filter out items that start with </
          return item.label:sub(1, 2) ~= '</'
        end, items)
      end

      return items
    end,
  },
})
