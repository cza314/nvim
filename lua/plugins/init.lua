local global = require('core.global')
local is_mac = global.is_mac

return {
  'folke/lazy.nvim',

  -- theme
  'yuttie/hydrangea-vim',
  'Shatur/neovim-ayu',
  'NTBBloodbath/doom-one.nvim',

  'kyazdani42/nvim-web-devicons',
  'nvim-lua/plenary.nvim',
  'mbbill/undotree',
  'folke/todo-comments.nvim',

  'nathom/filetype.nvim',
  'lewis6991/impatient.nvim',
  't9md/vim-choosewin',

  -- Automatic switching of input methods for macos
  {'ybian/smartim',
    enabled = is_mac,
    config = function ()
      require('plugins.config.smartim')
    end,
  },

  -- blankline
  {'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('plugins.config.indent')
    end,
  },

  -- color highlight
  {'uga-rosa/ccc.nvim',
    cmd = {
      'CccPick',
      'CccConvert',
      'CccHighlighterToggle',
      'CccHighlighterEnable',
      'CccHighlighterDisable',
    },
  },

  -- statusline
  {'glepnir/galaxyline.nvim',
    config = function()
      require('plugins.config.galaxyline')
    end,
  },

  -- highlight same word that under cursor
  {'RRethy/vim-illuminate',
    config = function()
      require('plugins.config.illuminate')
    end,
  },

  -- float UI
  {'folke/noice.nvim',
    enabled = false,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('plugins.config.noice')
    end,
  },

  -- git
  {'TimUntersberger/neogit',
    dependencies = {
      'sindrets/diffview.nvim',
    },
    cmd = 'Neogit',
    config = function()
      require('plugins.config.neogit')
    end,
  },

  {'lewis6991/gitsigns.nvim',
    config = function ()
      require('plugins.config.gitsigns')
    end,
  },

  -- cmake
  {'Civitasv/cmake-tools.nvim',
    ft = {"c", "cc", "cpp", "cmake"},
    config = function ()
      require('plugins.config.cmake-tools')
    end,
  },

  -- rust
  {'simrat39/rust-tools.nvim',
    ft = {"rust", "rs", "toml"},
    config = function ()
      require('plugins.config.rust-tools')
    end,
  },

  -- file browser
  {'nvim-tree/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    config = function()
      local M = require('plugins.config.nvim-tree')
      M.nvim_tree()
    end,
  },

  -- cursor jump
  {'ggandor/leap.nvim',
    keys = {'f', 'F', 't', 'T'},
    dependencies = {
      'ggandor/flit.nvim',
    },
    config = function()
      require('plugins.config.flit')
    end,
  },

  -- search
  {'nvim-telescope/telescope.nvim',
    cmd = {'Telescope'},
    dependencies = {
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-packer.nvim',
    },
    config = function()
      local M = require('plugins.config.telescope')
      M.telescope()
    end,
  },

  -- markdown
  {'iamcco/markdown-preview.nvim',
    dependencies = {
      'jakewvincent/mkdnflow.nvim',
    },
    build = "cd app && npm install",
    ft = {'markdown', 'md'},
    config = function()
      local M = require('plugins.config.markdown')
      M.markdown_preview()
      M.mkdnflow()
    end,
  },

  -- treesitter
  {'nvim-treesitter/nvim-treesitter',
    dependencies = {
      "folke/twilight.nvim",
    },
    build = ':TSUpdate',
    config = function ()
      require('plugins.config.treesitter')
    end,
  },

  -- install lsp and debuger
  {'williamboman/mason.nvim',
    cmd = {
      'Mason',
      'MasonInstall',
      'MasonInstallAll',
      'MasonLog',
      'MasonToolsInstall',
      'MasonToolsUpdate',
      'MasonUninstall',
      'MasonUninstallAll',
    },
    dependencies = {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'jayp0521/mason-null-ls.nvim',
      'williamboman/mason-lspconfig.nvim',
      'RubixDev/mason-update-all',
      'jayp0521/mason-nvim-dap.nvim',
    },
    config = function()
      require('plugins.config.mason')
    end,
  },

  -- debug
  {'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui', -- ui
      'theHamsta/nvim-dap-virtual-text',
      'jbyuki/one-small-step-for-vimkind', -- lua debuger
      'nvim-telescope/telescope-dap.nvim',
    },
    cmd = {
      'DapContinue',
      'DapToggleBreakpoint',
      'DapStepOver',
      'DapStepInto',
      'DapStepOut',
    },
    config = function()
      local M = require('plugins.config.dap')
      M.config()
      M.ui()
      M.virtual_text()
      M.python()
      M.codelldb()
      M.lua()
    end,
  },

  -- auto company
  {'hrsh7th/nvim-cmp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
      'quangnguyen30192/cmp-nvim-tags',
      'uga-rosa/cmp-dynamic',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      local M = require('plugins.config.cmp')
      M.cmp()
      M.luasnip()
      M.cmp_dynamic()
    end,
  },

  -- lsp
  {'neovim/nvim-lspconfig',
    dependencies = {
      'nvim-lua/lsp-status.nvim',        -- lsp status
      'hrsh7th/cmp-nvim-lsp',            -- cmp
      'ray-x/lsp_signature.nvim',        -- Show function signature
      'glepnir/lspsaga.nvim',            -- lsp plugin
      'j-hui/fidget.nvim',               -- show lsp progress
    },
    config = function()
      local M = require('plugins.config.lsp')
      M.lsp()
      M.lspsaga()
      M.fidget()
      M.mapping()
      M.menu()
    end,
  },

  -- hydra
  {'anuvyklack/hydra.nvim',
    config = function ()
      require('plugins.config.hydra')
    end
  },

  -- show keymap
  {'folke/which-key.nvim',
    config = function()
      require('plugins.config.whichkey')
    end,
  },
}
