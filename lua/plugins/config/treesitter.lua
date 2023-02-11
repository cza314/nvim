local global = require('core.global')
local installed = global.installed

require'nvim-treesitter.configs'.setup {
  ensure_installed = installed,
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
