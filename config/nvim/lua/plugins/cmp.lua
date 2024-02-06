require("main")
require("utils")
modules("cmp", function(extension) 
  table.insert(plugins, extension)
end)
return {
  "hrsh7th/nvim-cmp",
  config = function()
    require("cmp").setup()
  end
}
