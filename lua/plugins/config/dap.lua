local global = require('core.global')
local dap = require('dap')
local M = {}

function M.config()
  vim.fn.sign_define(
    'DapBreakpoint',
    { text   = "⊚",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl  = ""
    })

  vim.fn.sign_define(
    'Dapstooped',
    { text   = "❀",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl  = ""
    })

  vim.fn.sign_define(
    'DapBreakpointRejected',
    { text   = "▷",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    })

  -- auto open ui
  local dapui = require("dapui")

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dap.repl.close()
    dapui.close()
    vim.api.nvim_command("DapVirtualTextDisable")
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dap.repl.close()
    dapui.close()
    vim.api.nvim_command("DapVirtualTextDisable")
  end
  dap.listeners.before.disconnect["dapui_config"] = function()
    dap.repl.close()
    dapui.close()
    vim.api.nvim_command("DapVirtualTextDisable")
  end

  dap.set_log_level("DEBUG")

  require('dap.ext.vscode').load_launchjs(nil, {cppdbg = {'cpp'}})
end

function M.ui()
  local dapui = require("dapui")
  dapui.setup({
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40,
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25,
        position = "bottom",
      },
    },
  })
end

function M.mapping()
  local set_map = require('core.utils').set_map
  local map = {
    {'n',  '<F5>', '<CMD>:DapContinue<CR>'},
    {'n',  '<F3>', '<CMD>:DapToggleRepl<CR>'},
    {'n',  '<F9>', '<CMD>:DapToggleBreakpoint<CR>'},
    {'n',  '<F10>', '<CMD>:DapStepOver<CR>'},
    {'n',  '<F11>', '<CMD>:DapStepInto<CR>'},
    {'n',  '<F12>', '<CMD>:DapStepOut<CR>'},
  }

  for _,m in ipairs(map) do
    set_map(m[1], m[2], m[3], {noremap = true})
  end

  require("which-key").register({
    ["<leader>d"]  = { name = "Debug+"},
  })
end

function M.hydra()
  local Hydra = require('hydra')
  local hint = [[
    (_c_)Continue  (_b_)Breakpoint  (_s_)StepOver  (_n_)StepInto  (_o_)StepOut
  ]]
  Hydra({
    name = "debug",
    hint = hint,
    config = {
      color = 'pink',
      invoke_on_body = false,
      hint = {
        position = 'bottom',
        border = 'rounded',
      },
    },
    mode = 'n',
    body = '<leader>d',
    heads = {
      {'c', '<CMD>:DapContinue<CR>',          {desc = 'Continue'}},           -- 执行到下一断点
      {'b', '<CMD>:DapToggleBreakpoint<CR>',  {desc = 'Breakpoint'}},         -- 断点
      {'s', '<CMD>:DapStepOver<CR>',          {desc = 'StepOver'}},           -- 单步跳过执行
      {'n', '<CMD>:DapStepInto<CR>',          {desc = 'StepInto'}},           -- 单步执行
      {'o', '<CMD>:DapStepOut<CR>',           {desc = 'StepOut'}},            -- 跳出当前函数
      { '<Esc>', nil,                         {exit = true}},
    },
  })
end

function M.virtual_text()
  require("nvim-dap-virtual-text").setup {
    enabled = true,
    enabled_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = true,
    show_stop_reason = true,
    commented = false,
    virt_text_pos = 'eol',
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil
  }
end

function M.python()
  local python = global.debug.python

  dap.adapters.python = {
    type = "executable",
    command = python,
    args = { "-m", "debugpy.adapter" },
  }

  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = python,
      console = "integratedTerminal",
    }
}
end

function M.codelldb()
  local lldb = global.debug.lldb

  dap.adapters.lldb = {
    type = 'server',
    name = 'lldb',
    port = "${port}",
    executable = {
      command = lldb,
      args = {"--port", "${port}"},
    }
  }

  dap.configurations.cpp = {
    {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      console = "integratedTerminal",
    },
  }

  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

return M
