local global = require('core.global')

local M = {}

-- set map
function M.set_map(map)
  for _,m in ipairs(map) do
    for i = 1,#m[1] do
      local mode = string.sub(m[1],i,i)
      if m[4] == nil then
        m[4] = {noremap = true}
      end
      vim.keymap.set(mode, m[2], m[3], m[4])
    end
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
