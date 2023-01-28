local global = {}

local data = vim.fn.stdpath('data') .. '/'
local os_name = vim.loop.os_uname().sysname

local is_mac     = os_name == 'Darwin'
local is_linux   = os_name == 'Linux'
local is_windows = os_name == 'Windows'


function global:load_variables()

  -- 判断系统
  self.is_mac     = is_mac
  self.is_linux   = is_linux
  self.is_windows = is_windows

  self.cache_dir     = data .. '.cache/'
  self.lazy          = data .. '/lazy/lazy.nvim'
  self.lsp_path      = data .. 'lsp_servers/'
  self.friendly_snippets = data .. 'lazy/friendly-snippets' -- friendly-snippets

  -- lsp 参数
  self.lsp   = {
    python   = 'jedi-language-server',
    clangd   = data .. 'mason/bin/clangd',
    lua      = data .. 'mason/bin/lua-language-server',
    rust     = data .. 'mason/bin/rust-analyzer',
    markdown = data .. 'mason/bin/marksman',
    bash     = data .. 'mason/bin/bash-language-server',
  }

  self.debug = {
    lldb = data .. 'mason/bin/codelldb',
    python = '/usr/bin/python3',
  }

  self.treesitter = {
    "c",
    "lua",
    "vim",
    "help",
    "rust",
    "python",
    "markdown",
    "json",
    "org",
  }

end

global:load_variables()

return global
