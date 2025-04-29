local options = {
  formatters_by_ft = {
    php = { "php_cs_fixer" },
    blade = { "blade-formatter" },
    lua = { "stylua" },
  },
  formatters = {
    php_cs_fixer = {
      env = {
        PHP_CS_FIXER_IGNORE_ENV = "1",
      },
      args = function()
        local config_path = vim.fn.expand "~/.config/nvim/after/styles/php/php-cs-fixer.dist.php"
        return {
          "fix",
          "--using-cache=no",
          "--config=" .. config_path,
          "$FILENAME",
        }
      end,
    },
    ["blade-formatter"] = {
      args = {
        "--write",
        "--indent-size=2",
        "$FILENAME",
      },
      stdin = false,
      ignore_stdout = true,
      ignorestderr = true,
    },
  },
}
return options
