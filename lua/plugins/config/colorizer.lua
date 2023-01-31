local M = {}

function M.mapping()
  local set_map = require('core.utils').set_map
  set_map({
    {'n', '<leader>pc', '<CMD>ColorizerToggle<CR>'},
  })

  require("which-key").register({
    ["<leader>pc"] = { name = "Colorizer"},
  })
end

return M
