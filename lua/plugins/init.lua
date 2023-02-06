local global = require('core.global')
local installed = global.treesitter
local is_mac = global.is_mac

return {
  'folke/lazy.nvim',

  -- theme
  'yuttie/hydrangea-vim',
  'Shatur/neovim-ayu',
  'NTBBloodbath/doom-one.nvim',
  'sainnhe/sonokai',
  'jim-at-jibba/ariake-vim-colors',
  'Th3Whit3Wolf/onebuddy',
  'sainnhe/edge',
  'Th3Whit3Wolf/space-nvim',
  'marko-cerovac/material.nvim',
  'folke/tokyonight.nvim',

  'kyazdani42/nvim-web-devicons',
  'nvim-lua/plenary.nvim',
  'mbbill/undotree',
  'RRethy/vim-illuminate',         -- highlight same word that under cursor
  'folke/todo-comments.nvim',      -- TODO

  'nathom/filetype.nvim',
  'lewis6991/impatient.nvim',

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

  -- preview color
  {'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('plugins.config.colorizer').mapping()
    end,
  },

  -- statusline
  {'glepnir/galaxyline.nvim',
    config = function()
      require('plugins.config.galaxyline')
    end,
  },

  -- choose window and tab
  {'t9md/vim-choosewin',
    config = function()
      local M = require('plugins.config.choosewin')
      M.choosewin()
      M.mapping()
    end,
  },

  -- neogit
  {'TimUntersberger/neogit',
    dependencies = {
      'sindrets/diffview.nvim',
    },
    cmd = 'Neogit',
    config = function()
      require('plugins.config.neogit')
    end,
  },

  -- cmake
  {'Civitasv/cmake-tools.nvim',
    config = function ()
      require('plugins.config.cmake-tools')
    end,
  },

  -- rust
  {'simrat39/rust-tools.nvim',
    config = function ()
      require('plugins.config.rust-tools')
    end,
  },

  -- file browser
  {'nvim-tree/nvim-tree.lua',
    config = function()
      local M = require('plugins.config.nvim-tree')
      M.nvim_tree()
      M.mapping()
    end,
  },

  -- cursor jump
  {'ggandor/leap.nvim',
    dependencies = {
      'ggandor/flit.nvim',
    },
    event = 'BufRead',
    config = function()
      require('plugins.config.flit')
    end,
  },

  -- code fold
  {'anuvyklack/pretty-fold.nvim',
    dependencies = {'anuvyklack/nvim-keymap-amend'},
    event = 'BufRead',
    config = function()
      require('plugins.config.fold')
    end,
  },

  -- search
  {'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-packer.nvim',
    },
    config = function()
      local M = require('plugins.config.telescope')
      M.telescope()
      M.mapping()
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
      M.mapping()
    end,
  },

  -- treesitter
  {'nvim-treesitter/nvim-treesitter',
    dependencies = {
      "folke/twilight.nvim",
    },
    build = ':TSUpdate',
    ft = installed,
    config = function ()
      require('plugins.config.treesitter')
    end,
  },

  -- install lsp and debuger
  {'williamboman/mason.nvim',
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
      'nvim-telescope/telescope-dap.nvim',
      'jbyuki/one-small-step-for-vimkind', -- lua debuger
    },
    config = function()
      local M = require('plugins.config.dap')
      M.config()
      M.ui()
      M.mapping()
      M.hydra()
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
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
      'quangnguyen30192/cmp-nvim-tags',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      local M = require('plugins.config.cmp')
      M.cmp()
      M.luasnip()
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
    event = 'BufRead',
    config = function()
      local M = require('plugins.config.lsp')
      M.lsp()
      M.lspsaga()
      M.fidget()
      M.mapping()
      M.menu()
    end,
  },

  -- menu
  {'anuvyklack/hydra.nvim',
    dependencies = {
      'jbyuki/venn.nvim',
    }
  },

  -- show keymap
  {'folke/which-key.nvim',
    event = 'BufRead',
    config = function()
      require('plugins.config.whichkey')
    end,
  },
}
