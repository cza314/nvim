vim.o.foldmethod = "indent";
vim.o.foldexpr   = "nvim_treesitter#foldexpr()";

require'nvim-treesitter.configs'.setup {
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
