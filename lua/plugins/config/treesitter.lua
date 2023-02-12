vim.o.foldmethod = "indent";
vim.o.foldexpr   = "nvim_treesitter#foldexpr()";

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "vim",
    "help",
    "lua",
    "query",
    "markdown",
    "markdown_inline"
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
