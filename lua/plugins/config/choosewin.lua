local M = {}

function M.choosewin()
  vim.g.choosewin_overlay_enable = 0
end

function M.mapping()
  local set_map = require('core.utils').set_map
  local map = {
    {'n', '<leader>w','<CMD>:ChooseWin<CR>'},
  }

  for _,m in ipairs(map) do
    set_map(m[1],m[2],m[3], {noremap = true})
  end
end

return M
