local M = {}

function M.choosewin()
  -- 选择是屏幕中间显示分屏编号
  vim.g.choosewin_overlay_enable = 0
end

function M.mapping()
  local set_map = require('core.utils').set_map
  set_map({
    {'n', '<leader>w','<CMD>:ChooseWin<CR>'},
  })
end

return M
