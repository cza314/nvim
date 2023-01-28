local set_map = require('core.utils').set_map

local map = {
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
  {'n',  '<Space>1',    '<Esc>:tabn 1<CR>'},
  {'n',  '<Space>2',    '<Esc>:tabn 2<CR>'},
  {'n',  '<Space>3',    '<Esc>:tabn 3<CR>'},
  {'n',  '<Space>te',   '<CMD>:tabe<CR>'},
  {'n',  '<Space>tt',   '<Esc>:tabn '},
  {'n',  '<Space>tq',   '<Esc>:tabc '},
  {'n',  '<Space>to',   '<CMD>:tabo<CR>'},
  {'n',  '<Space>tn',   '<CMD>:tabn<CR>'},
  {'n',  '<Space>tp',   '<CMD>:tabp<CR>'},
  -- window
  {'n',  '<Space>w',    '<C-w>'},
  {'n',  '<Space>we',   '<CMD>:Ex<CR>'},
  {'i',  '<C-g>','<Esc>'},
  -- move
  {'i',  '<C-a>' ,'<Esc>0i'},
  {'i',  '<C-e>' ,'<Esc>$a'},
}

for _,m in ipairs(map) do
  set_map(m[1],m[2],m[3], {noremap = true})
end
