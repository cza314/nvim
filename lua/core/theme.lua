local mode = require('core.utils').get_dark_mode()

if mode == false then
  vim.cmd('colorscheme ayu-light')
  vim.cmd('colorscheme doom-one')
else
  vim.cmd('colorscheme hydrangea')
end
