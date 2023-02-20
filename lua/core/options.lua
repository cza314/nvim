local global = require('core.global')

local wo = vim.wo
local cmd = vim.api.nvim_command
local opt = vim.opt
local g = vim.g
local o = vim.o

o.autochdir      = false;
o.termguicolors  = true;
o.errorbells     = false;
o.visualbell     = false;
o.hidden         = true;
o.magic          = true;
o.wildignorecase = true;
o.backup         = false;
o.writebackup    = false;
o.swapfile       = false;
o.smarttab       = true;
o.shiftround     = true;
o.timeout        = true;
o.ignorecase     = true;
o.smartcase      = true;
o.infercase      = true;
o.hlsearch       = true;
o.incsearch      = false;
o.wrapscan       = true;
o.startofline    = false;
o.splitbelow     = true;
o.splitright     = true;
o.showmode       = false;
o.ruler          = false;
o.foldenable     = true;
o.list           = true;
o.showcmd        = true;
o.equalalways    = true;
o.history        = 2000;
o.timeoutlen     = 100;
o.scrolloff      = 5;
o.foldlevelstart = 99;
o.showtabline    = 1;
o.pumheight      = 15;
o.laststatus     = 3;
o.pumblend       = 10;
o.winblend       = 10;
o.helpheight     = 80;
o.cmdheight      = 1;
o.mouse          = "nv";
o.fileformats    = "unix," ..
                   "mac,"  ..
                   "dos";
o.virtualedit    = "block";
o.encoding       = "utf-8";
o.foldmethod     = "indent";
o.foldexpr       = "nvim_treesitter#foldexpr()";
o.viewoptions    = "folds,"  ..
                   "cursor," ..
                   "curdir," ..
                   "slash,"  ..
                   "unix";
o.sessionoptions = "curdir,"   ..
                   "help,"     ..
                   "tabpages," ..
                   "winsize";
o.clipboard      = "unnamedplus";
o.wildignore     = ".git,"   ..
                   ".hg,"    ..
                   ".svn,"   ..
                   "*.pyc,"  ..
                   "*.o,"    ..
                   "*.out,"  ..
                   "*.jpg,"  ..
                   "*.jpeg," ..
                   "*.png,"  ..
                   "*.gif,"  ..
                   "*.zip,"  ..
                   "**/tmp/**," ..
                   "*.DS_Store," ..
                   "**/node_modules/**," ..
                   "**/bower_modules/**";
o.directory      = global.cache_dir ..
                   "swag/";
o.undodir        = global.cache_dir ..
                   "undo/";
o.backupdir      = global.cache_dir ..
                   "backup/";
o.viewdir        = global.cache_dir ..
                   "view/";
o.spellfile      = global.cache_dir ..
                   "spell/en.uft-8.add";
o.shada          = "!,'300,<50,@100,s10,h";
o.backupskip     = "/tmp/*,"    ..
                   "$TMPDIR/*," ..
                   "$TMP/*,"    ..
                   "$TEMP/*,"   ..
                   "*/shm/*,"   ..
                   "/private/var/*," ..
                   ".vault.vim";
o.complete       = ".,w,b,k";
o.inccommand     = "nosplit";
o.grepformat     = "%f:%l:%c:%m";
o.grepprg        = 'rg ' ..
                   '--hidden ' ..
                   '--vimgrep ' ..
                   '--smart-case --';
o.breakat        = [[\ \	;:,!?]];
o.whichwrap      = "h,l,<,>,[,],~";
o.switchbuf      = "useopen";
o.backspace      = "indent," ..
                   "eol,"    ..
                   "start";
o.diffopt        = "filler," ..
                   "iwhite," ..
                   "internal," ..
                   "algorithm:patience";
o.completeopt    = "menuone," ..
                   "noinsert," ..
                   "noselect";
o.jumpoptions    = "stack";
o.display        = "lastline";
o.showbreak      = "+---";
o.listchars      = "tab:»·,"  ..
                 "nbsp:+,"  ..
                 "trail:·," ..
                 "extends:→," ..
                 "precedes:←";

opt.undofile       = true
opt.expandtab      = true
opt.autoindent     = true
opt.wrap           = true
opt.linebreak      = false
opt.number         = true
opt.relativenumber = true
opt.cursorline     = true
opt.cursorcolumn   = true
opt.synmaxcol      = 2500
opt.tabstop        = 2
opt.shiftwidth     = 2
opt.softtabstop    = -1
opt.conceallevel   = 0
opt.formatoptions  = "1jcroql"
opt.breakindentopt = "shift:2," ..
                     "min:20"
opt.signcolumn     = "auto"
opt.concealcursor  = "niv"

g.AutoClosePreserveDotReg = 0
g.mapleader = "\\";

cmd('set shortmess+=c')
cmd('unmenu PopUp')
