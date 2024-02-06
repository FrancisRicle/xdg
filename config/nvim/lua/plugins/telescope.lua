require("main")
require("utils")
modules("telescope", function(extension) 
  table.insert(plugins, extension)
end)
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_strategy = "cursor",
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
        }
      }
    })
  end
}
