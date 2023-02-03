local Path = require('plenary.path')
require('tasks').setup({
  default_params = {
    cmake = {
      cmd = 'cmake',
      build_dir = tostring(Path:new('{cwd}', 'build', '{os}-{build_type}')),
      build_type = 'Debug',
      dap_name = 'lldb',
      args = {
        configure = {
          '-D' , 'CMAKE_CXX_FLAGS=-gdwarf-4',
        },
      },
    },
  },
  save_before_run = true,
  params_file = 'neovim.json',
  quickfix = {
    pos = 'botright',
    height = 12,
  },
  dap_open_command = function() return require('dap').repl.open() end,
})
