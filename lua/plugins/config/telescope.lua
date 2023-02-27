local M = {}

function M.telescope()
  require('telescope').setup {
    defaults = {
      default = {
        COLORTERM = "truecolor"
      },
      file_ignore_patterns = {
        "./.git/*",
      },
      preview = false,
    },
  }
end

return M
