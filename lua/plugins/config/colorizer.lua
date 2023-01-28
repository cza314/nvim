local M = {}

function M.mapping()
  local set_map = require('core.utils').set_map
  local map = {
    {'n', '<leader>pc', '<CMD>ColorizerToggle<CR>'},
  }

  for _,m in ipairs(map) do
    set_map(m[1],m[2],m[3], {noremap = true})
  end

  require("which-key").register({
    ["<leader>pc"] = { name = "Colorizer"},
  })
end

return M
