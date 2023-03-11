local global = require("core.global")
local M = {}

function M.cmp()
  local present, cmp = pcall(require, "cmp")
  local lspkind = require('lspkind')

  if not present then
    return
  end

  local function border(hl_name)
    return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
    }
  end

  local cmp_window = require "cmp.utils.window"

  cmp_window.info_ = cmp_window.info
  cmp_window.info = function(self)
    local info = self:info_()
    info.scrollable = false
    return info
  end

  local config = {
    completion = {
      keyword_length = 1,
    },
    enabled = function()
      return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
    end,
    window = {
      completion = {
        border = border "CmpBorder",
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = border "CmpDocBorder",
      },
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    },
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "calc" },
      { name = "emoji" },
      { name = "tags" },
      { name = "dynamic" },
      { name = "nvim_lsp_signature_help" },
      { name = 'npm', keyword_length = 4 },
      { name = "crates" },
    },
    formatting = {
      format = lspkind.cmp_format({with_text = true, maxwidth = 50}),
    },
  }
  cmp.setup(config)
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {{ name = 'path' }},
      {{ name = 'cmdline', option = { ignore_cmds = { 'Man', '!' }}}}
    )
  })
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {{ name = 'nvim_lsp_document_symbol' }},
      {{ name = 'buffer' }}
    ),
  })
  cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" },
    },
  })
end

function M.luasnip()
  local friendly_snippets = global.friendly_snippets
  require("luasnip.loaders.from_vscode").lazy_load({
    paths = { friendly_snippets }
  })
end

function M.cmp_dynamic()
  local Date = require("cmp_dynamic.utils.date")

  require("cmp_dynamic").register({
    {
      label = "today",
      insertText = 1,
      detail = 1,
      resolve = true,
      cb = {
        function()
          return os.date("%Y/%m/%d")
        end,
      },
    },
    {
      label = "next Monday",
      insertText = 1,
      detail = 1,
      resolve = true,
      cb = {
        function()
          return Date.new():add_date(7):day(1):format("%Y/%m/%d")
        end,
      },
    },
  })
end

M.crates = function ()
  require('crates').setup {}
end

return M
