local set_map = require('core.utils').set_map

set_map({
  {'n',  'vv', 'v'},
  {'n',  'vb', '<C-v>'},
  -- delete space
  {'n',  '<Space>ed',   '<CMD>:%s/\\s\\+$<CR>'},
  -- bufer
  {'n',  '<Space>bb',   ':b '},
  {'n',  '<Space>bd',   ':bd '},
  {'n',  '<Space>bn',   '<CMD>:bnext<CR>'},
  {'n',  '<Space>bp',   '<CMD>:bprevious<CR>'},
  {'n',  '<Space>bs',   '<CMD>:buffers<CR>'},
  -- Tab
  {'n',  '<Space>te',   '<CMD>:tabe<CR>'},
  {'n',  '<Space>tt',   '<Esc>:tabn '},
  {'n',  '<Space>tq',   '<Esc>:tabc '},
  {'n',  '<Space>to',   '<CMD>:tabo<CR>'},
  {'n',  '<Space>tn',   '<CMD>:tabn<CR>'},
  {'n',  '<Space>tp',   '<CMD>:tabp<CR>'},
  -- window
  {'n',  '<Space>w',    '<C-w>'},
  {'n',  '<Space>q',    '<CMD>:q<CR>'},
  {'i',  '<C-g>','<Esc>'},
  -- move
  {'i',  '<C-a>' ,'<Esc>0i'},
  {'i',  '<C-e>' ,'<Esc>$a'},
})
