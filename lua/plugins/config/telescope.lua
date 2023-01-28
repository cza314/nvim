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
  local map = {
    {'n', '<leader>ss','<CMD>Telescope builtin'     .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sf','<CMD>Telescope find_files'  .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sg','<CMD>Telescope live_grep'   .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sb','<CMD>Telescope buffers'     .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sh','<CMD>Telescope help_tags'   .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>so','<CMD>Telescope oldfiles'    .. ' theme=' .. theme .. '<CR>'},
  }

  for _,m in ipairs(map) do
    set_map(m[1],m[2],m[3], {noremap = true})
  end

  require("which-key").register({
    ["<leader>s"]  = { name = "Search+"},
    ["<leader>ss"] = { name = "Telescope"},
    ["<leader>sf"] = { name = "File"},
    ["<leader>sg"] = { name = "Grep"},
    ["<leader>sb"] = { name = "Buffer"},
    ["<leader>sh"] = { name = "Help"},
    ["<leader>so"] = { name = "Oldfile"},
  })
end

return M
