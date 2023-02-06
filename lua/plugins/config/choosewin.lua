local M = {}

function M.choosewin()
  vim.g.choosewin_overlay_enable = 0
end

function M.mapping()
  local set_map = require('core.utils').set_map
  set_map({
    {'n', '<leader>w','<CMD>:ChooseWin<CR>'},
  })
end

return M
