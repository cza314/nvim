local global = require('core.global')

local M = {}

-- set map
function M.set_map(mode, keymap, rhs, options)
  for i = 1,#mode do
    local m = string.sub(mode,i,i)
    vim.keymap.set(m, keymap, rhs, options)
  end
end

-- set menu
function M.set_popup_menu(mode, menu, rhs)
  for i = 1,#mode do
    local m = string.sub(mode,i,i)
    vim.api.nvim_command(m .. 'noremenu PopUp.' .. menu .. ' ' .. rhs)
  end
end

-- get system mode is dark or light
function M.get_dark_mode()
  if(global.is_mac) then
    local result = io.popen("osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"):read("l")
    if (result == "true") then
      return true
    end
  end
  return false
end

return M
