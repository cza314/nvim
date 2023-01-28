local M = {}

function M.nvim_tree()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.opt.termguicolors = true

  require("nvim-tree").setup({
    sort_by = "name",
    on_attach = "disable",
    remove_keymaps = false,
    sync_root_with_cwd = false,
    view = {
      float = {
        enable = true,
        quit_on_focus_loss = true,
      },
    },
  })
end

function M.mapping()
  local set_map = require('core.utils').set_map

  local map = {
    {'n', '<leader>b', '<CMD>NvimTreeToggle<CR>'},
  }

  for _, m in ipairs(map) do
    set_map(m[1], m[2], m[3], {silent = true})
  end

  require("which-key").register({
    ['<leader>b'] = { name = "browser"},
  })
end

return M
