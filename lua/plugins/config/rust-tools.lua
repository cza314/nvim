local global = require('core.global')
local lldb = global.debug.lldb
local rust = global.lsp.rust

require('rust-tools').setup({
  server = {
    cmd = { rust },
    standalone = false,
  },
  dap = {
      adapter = {
      type = 'server',
      name = 'lldb',
      port = "${port}",
      executable = {
        command = lldb,
        args = {"--port", "${port}"},
      },
    },
  },
})
