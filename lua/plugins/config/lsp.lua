local global = require('core.global')
local M = {}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
  }
)

function M.clangd()
  require'lspconfig'.clangd.setup({
    cmd = {
      global.lsp.clangd,
      "--background-index",
      "--compile-commands-dir=build",
      "-j=12",
      "--query-driver=/usr/bin/clang++",
      "--clang-tidy",
      "--clang-tidy-checks=performance-*,bugprone-*",
      "--all-scopes-completion",
      "--completion-style=detailed",
      "--header-insertion=iwyu",
      "--pch-storage=disk",
    },
    filetypes = { "c", "cc", "cpp", "objc", "objcpp" , "h"},
    on_init = {
      clangdFileStatus = true,
    },
    handlers = require "lsp-status".extensions.clangd.setup(),
  })
end

function M.lua()
  require('lspconfig').lua_ls.setup({
    cmd = { global.lsp.lua },
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      }
    },
  })
end

function M.python()
  require('lspconfig').jedi_language_server.setup({
    cmd = { global.lsp.python },
  })
end

function M.rust()
  require('lspconfig').rust_analyzer.setup({
    cmd = { global.lsp.rust },
    filetypes = { "rust" },
    settings = {
      ["rust-analyzer"] = {}
    },
  })
end

function M.bash()
  require('lspconfig').bashls.setup({
    cmd = { global.lsp.bash, "start" },
    filetypes = { "sh" },
  })
end

function M.cmake()
  require'lspconfig'.cmake.setup({
    cmd = { global.lsp.cmake },
  })
end

function M.markdown()
  require'lspconfig'.marksman.setup({
    cmd = {
      global.lsp.markdown,
      "server",
    },
    filetypes = { "markdown" },
  })
end

function M.lspsaga()
  require('lspsaga').setup({
    lightbulb = {
        enable = false,
        enable_in_insert = false,
    },
    symbol_in_winbar = {
        in_custom = true,
        enable = true,
        separator = ' ',
        show_file = true,
        file_formatter = "%:t",
        click_support = false,
    },
  })
  vim.wo.stl = require('lspsaga.symbolwinbar'):get_winbar()
end

function M.fidget()
  require('fidget').setup{}
end

function M.mapping()
  local set_map = require('core.utils').set_map
  set_map({
    {'n', 'K',  '<CMD>Lspsaga hover_doc<CR>'},
    {'n', 'gr', '<CMD>Lspsaga rename<CR>'},
    {'n', 'gd', '<CMD>Lspsaga peek_definition<CR>'},
    {'n', 'gs', '<CMD>Lspsaga signature_help<CR>'},
    {'n', '[e', '<CMD>Lspsaga diagnostic_jump_prev<CR>'},
    {'n', ']e', '<CMD>Lspsaga diagnostic_jump_next<CR>'},
    {'n', "[E", function()
      require("lspsaga.diagnostic").goto_prev({
        severity = vim.diagnostic.severity.ERROR
      })
    end},
    {'n', "]E", function()
      require("lspsaga.diagnostic").goto_next({
        severity = vim.diagnostic.severity.ERROR
      })
    end},
    {'n',   '<leader>lo', '<CMD>Lspsaga outline<CR>'},
    {'n',   '<leader>lf', '<CMD>Lspsaga lsp_finder<CR>'},
    {'n',   '<leader>la', '<CMD>Lspsaga code_action<CR>'},
    {"nvti", '<C-\\>',    '<CMD>Lspsaga term_toggle<CR>'},
  })

  require("which-key").register({
    ["<leader>l"]  = { name = "Lsp+"},
    ["<leader>lo"] = { name = "Outline"},
    ["<leader>la"] = { name = "Code Action"},
    ['<leader>lf'] = { name = "finder"},
  })
end

function M.menu()
  local set_menu = require('core.utils').set_popup_menu
  set_menu('a', '-1-',                '<Nop>')
  set_menu('n', 'Document',           '<CMD>Lspsaga hover_doc<CR>')
  set_menu('n', 'Rename',             '<CMD>Lspsaga rename<CR>')
  set_menu('n', 'Peek\\ Definition',  '<CMD>Lspsaga peek_definition<CR>')
  set_menu('n', 'LSoutline',          '<CMD>Lspsaga outline<CR>')
end

function M.lsp()
  M.clangd()
  M.lua()
  M.markdown()
  M.bash()
  M.python()
  M.rust()
  M.cmake()
end

return M
