local cmp = require("cmp")

cmp.setup {
  completion = {
    get_trigger_characters = function(trigger_characters)
      local new_trigger_characters = {}
      for _, char in ipairs(trigger_characters) do
        if char ~= '>' then
          table.insert(new_trigger_characters, char)
        end
      end
      return new_trigger_characters
    end
  }
}
