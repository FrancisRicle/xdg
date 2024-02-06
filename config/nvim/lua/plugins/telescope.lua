local extensions = {}
modules("telescope", function(module)
  table.insert(extensions, module)
end)
local config = function()
  for extension in extensions do
    local telescope = require("telescope")
    telescope.load_extension(extension.name)
    telescope.extensions[extension.name] = extension.telescope_config
  end
end
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  ["extensions"] = extensions,
  ["config"] = config
}
