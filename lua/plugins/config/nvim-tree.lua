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

return M
