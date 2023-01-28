local set_menu = require('core.utils').set_popup_menu

set_menu('a',   'Explorer', '<CMD>Ex<CR>')
set_menu('v',   'Copy',         '"+y')
set_menu('v',   'Cut',          '"+x')
set_menu('a',   'Paste',        '"+P')
set_menu('v',   'Delete',       '"_x')
set_menu('nvi', 'Select\\ All', '<Esc>ggVG')
