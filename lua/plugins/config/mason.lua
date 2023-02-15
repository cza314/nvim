local mason = require "mason"

local options = {
  ensure_installed = {
    -- lsp
    "lua-language-server",
    "clangd",
    "cmake-language-server",
    "rust-analyzer",
    "marksman",
    "jedi-language-server",
    -- debuger
    "debugpy",
    "codelldb",
  },
  PATH = "skip",
  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ﮊ",
    },
  },
  max_concurrent_installers = 10,
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})

mason.setup(options)
