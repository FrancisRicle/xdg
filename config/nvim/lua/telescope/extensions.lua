require("utils")
local extensions = {}
modules("telescope", function(module)
  table.insert(extensions, module)
end)
return extensions
