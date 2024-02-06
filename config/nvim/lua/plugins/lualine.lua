local colors = {
  black  = "#15161e",
  red    = "#f7768e",
  green  = "#9ece6a",
  yellow = "#e0af68",
  blue   = "#7aa2f7",
  violet = "#bb9af7",
  cyan   = "#7dcfff",
  white  = "#a9b1d6",
  grey   = "#414868",
}
local buffers = {
  "buffers",
  mode = 4,
  separator = { left = '', right = '' }
}
local lualine_config = {  
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
local config = function()
  local lualine = require('lualine') 
  lualine.setup(lualine_config)
end
return {
  "nvim-lualine/lualine.nvim",
  ["config"] = config
}
