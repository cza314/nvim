local global = require('core.global')
local plugins = require('plugins')
local lazypath = global.lazy

local M = {}

function M.lazy_init()
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    })
  end
  vim.opt.runtimepath:prepend(lazypath)

  require("lazy").setup(plugins)
end

function M.mapping()
  local set_map = require('core.utils').set_map
  local theme = 'dropdown' -- theme for telescope
  set_map({
    {'n', '<leader>ss','<CMD>Telescope builtin'     .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sf','<CMD>Telescope find_files'  .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sg','<CMD>Telescope live_grep'   .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sb','<CMD>Telescope buffers'     .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>sh','<CMD>Telescope help_tags'   .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>so','<CMD>Telescope oldfiles'    .. ' theme=' .. theme .. '<CR>'},
    {'n', '<leader>b', '<CMD>NvimTreeToggle<CR>'},
  })
end

return M
