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

function M.mapping()
  local set_map = require('core.utils').set_map
  local theme = 'dropdown'
  set_map({
    {'n', '<leader>ss','<CMD>Telescope builtin'     .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sf','<CMD>Telescope find_files'  .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sg','<CMD>Telescope live_grep'   .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sb','<CMD>Telescope buffers'     .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sh','<CMD>Telescope help_tags'   .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>so','<CMD>Telescope oldfiles'    .. ' theme=' .. theme .. '<CR>'},
  })
end

return M
