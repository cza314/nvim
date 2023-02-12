require("which-key").setup {
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "",
  },
  layout = {
    height = {
      min = 2,
      max = 10
    },
    align = "center",
  },
}
require("which-key").register({
  ["<Space>e"]   = { name = "Edit+"},
  ["<Space>ed"]  = { name = "Delete Space"},

  ["<Space>b"]   = { name = "Buffer+"},
  ["<Space>bb"]  = { name = "Goto"},
  ["<Space>bd"]  = { name = "Delete"},
  ["<Space>bn"]  = { name = "Next"},
  ["<Space>bp"]  = { name = "Previous"},
  ["<Space>bs"]  = { name = "Buffers"},

  ["<Space>q"]   = { name = "quit" },

  ["<Space>t"]   = { name = "Tab+"},

  ["<Space>te"]  = { name = "New"},
  ["<Space>tt"]  = { name = "Goto"},
  ["<Space>tq"]  = { name = "Close"},
  ["<Space>to"]  = { name = "Close Others"},
  ["<Space>tn"]  = { name = "Next"},
  ["<Space>tp"]  = { name = "Previous"},

  ["<Space>1"]   = { name = "Tab 1"},
  ["<Space>2"]   = { name = "Tab 2"},
  ["<Space>3"]   = { name = "Tab 3"},
  ["<Space>4"]   = { name = "Tab 4"},
  ["<Space>5"]   = { name = "Tab 5"},
  ["<Space>6"]   = { name = "Tab 6"},
  ["<Space>7"]   = { name = "Tab 7"},
  ["<Space>8"]   = { name = "Tab 8"},
  ["<Space>9"]   = { name = "Tab 9"},

  ["<Space>w"]   = { name = "Windows+"},
  ["<Space>ws"]  = { name = "Split Vertically"},
  ["<Space>wv"]  = { name = "Split"},
  ["<Space>ww"]  = { name = "Switch"},
  ["<Space>wx"]  = { name = "Swap Cur Next"},
  ["<Space>wT"]  = { name = "Cur Into NewTab"},
  ["<Space>wq"]  = { name = "Quit"},
  ["<Space>wh"]  = { name = "Go Left"},
  ["<Space>wj"]  = { name = "Go Down"},
  ["<Space>wk"]  = { name = "Go Up"},
  ["<Space>wl"]  = { name = "Go Right"},
  ["<Space>w|"]  = { name = "Width Max"},
  ["<Space>w="]  = { name = "Eq Height Width"},
  ["<Space>we"]  = { name = "Explore"},

  ["v"]  = { name = "Visual+"},
  ["vv"] = { name = "Visual Mode"},
  ["vb"] = { name = "Visual Block"},
  ["<C-w>"]   = { name = "Windows+"},

  -- nvim-tree
  ['<leader>b'] = { name = "browser"},

  -- dap
  ["<leader>d"]  = { name = "Debug+"},


  -- Telescope
  ["<leader>s"]  = { name = "Search+"},
  ["<leader>ss"] = { name = "Telescope"},
  ["<leader>sf"] = { name = "File"},
  ["<leader>sg"] = { name = "Grep"},
  ["<leader>sb"] = { name = "Buffer"},
  ["<leader>sh"] = { name = "Help"},
  ["<leader>so"] = { name = "Oldfile"},
})
