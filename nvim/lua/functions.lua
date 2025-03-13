local M = {}

-- Function to display diagnostic codes
M.show_diagnostic_codes = function()
  local diagnostics = vim.diagnostic.get(0)
  for _, diagnostic in ipairs(diagnostics) do
    print(string.format("Code: %s, Source: %s, Message: %s", 
                       tostring(diagnostic.code or "nil"), 
                       diagnostic.source or "nil",
                       diagnostic.message))
  end
end

-- You can add more custom functions here

return M
