local Hydra = require('hydra')

-- debug
Hydra({
  name = "debug",
  hint = [[  (_c_)Continue  (_b_)Breakpoint  (_s_)StepOver  (_n_)StepInto  (_o_)StepOut  ]],
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
    {'c', '<CMD>:DapContinue<CR>',          {desc = 'Continue'}},
    {'b', '<CMD>:DapToggleBreakpoint<CR>',  {desc = 'Breakpoint'}},
    {'s', '<CMD>:DapStepOver<CR>',          {desc = 'StepOver'}},
    {'n', '<CMD>:DapStepInto<CR>',          {desc = 'StepInto'}},
    {'o', '<CMD>:DapStepOut<CR>',           {desc = 'StepOut'}},
    { '<Esc>', nil,                         {exit = true}},
  },
})
