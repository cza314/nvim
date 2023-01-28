local _, gl = pcall(require, 'galaxyline')
local gls = gl.section

gl.short_line_list = {
    'LuaTree',
    'vista',
    'dbui',
    'startify',
    'term',
    'nerdtree',
    'fugitive',
    'fugitiveblame',
    'plug'
}

local line_bg_color = '#FFFFFF'

local colors = {
    bg       = '#5C687A',
    line_bg  = line_bg_color,
    fg       = '#8FBCBB',
    fg_green = '#65a380',
    yellow   = '#E5C07B',
    cyan     = '#70C0BA',
    darkblue = '#83A598',
    green    = '#98C379',
    orange   = '#FF8800',
    purple   = '#C678DD',
    magenta  = '#C858E9',
    blue     = '#73BA9F',
    red      = '#D54E53',
}

local function insert_left(element)
  table.insert(gls.left, element)
end

local function insert_blank_line_at_left()
insert_left {
  Space = {
    provider = function () return ' ' end,
    highlight = {
      colors.line_bg,
    }
  }
}
end

local function insert_right(element)
  table.insert(gls.right, element)
end

local function insert_blank_line_at_right()
insert_right {
  Space = {
    provider = function () return ' ' end,
    highlight = {
      colors.line_bg,
    }
  }
}
end

-----------------------------------------------------
----------------- start insert ----------------------
-----------------------------------------------------

insert_blank_line_at_left()

insert_left{
  ViMode = {
    icon = function()
        local icons = {
            n      = ' ',
            i      = ' ',
            c      = 'ﲵ ',
            V      = ' ',
            [''] = ' ',
            v      = ' ',
            C      = 'ﲵ ',
            R      = '﯒ ',
            t      = ' ',
        }
        return icons[vim.fn.mode()]
      end,
    provider = function()
      -- auto change color according the vim mode
      local alias = {
          n      = 'N',
          i      = 'I',
          c      = 'C',
          V      = 'VL',
          [''] = 'V',
          v      = 'V',
          C      = 'C',
          ['r?'] = ':CONFIRM',
          rm     = '--MORE',
          R      = 'R',
          Rv     = 'R&V',
          s      = 'S',
          S      = 'S',
          ['r']  = 'HIT-ENTER',
          [''] = 'SELECT',
          t      = 'T',
          ['!']  = 'SH',
      }
      local mode_color = {
        n = colors.yellow,      i = colors.green,   v=colors.blue,
        [''] = colors.blue,   V=colors.blue,      c = colors.magenta,
        no = colors.red,        s = colors.orange,  S=colors.orange,
        [''] = colors.orange, ic = colors.yellow, R = colors.purple,
        Rv = colors.purple,     cv = colors.red,    ce=colors.red,
        r = colors.cyan,        rm = colors.cyan,   ['r?'] = colors.cyan,
        ['!'] = colors.red,     t = colors.red
      }

      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
      return alias[vim_mode]
    end,
    highlight = {
      colors.line_bg,
    },
  },
}

-------- left --------

insert_blank_line_at_left()
insert_blank_line_at_left()

insert_left{
  FileIcon = {
    provider = 'FileIcon',
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,
    },
  },
}

insert_blank_line_at_left()

insert_left {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {
      colors.green,
    },
    highlight = {
      colors.fg,
    },
  },
}

insert_left {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {
      colors.blue,
    },
    highlight = {
      colors.cyan,
      'bold'
    },
  }
}

insert_blank_line_at_left()

insert_left {
  GitIcon = {
    provider = function() return '  ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {
      colors.orange,
    },
  }
}

insert_left {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {
      '#8FBCBB',
      'bold'
    },
  }
}

-------- right --------

insert_right {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {
      colors.red,
    }
  }
}

insert_right {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {
      colors.yellow,
    },
  }
}
insert_blank_line_at_right()

insert_right{
  Encode = {
    provider = 'FileEncode',
    separator_highlight = {
      colors.blue,
    },
    highlight = {
      colors.cyan,
      'bold'
    },
  }
}

insert_blank_line_at_right()
