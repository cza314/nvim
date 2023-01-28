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

return M
