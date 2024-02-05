local extensions = {}
for file in vim.fs.dir(vim.fn.stdpath("config") .. "/lua/telescope") do
  if file ~= "init.lua" then
    local extension = require("telescope." .. string.sub(file, 1, -5))
    if extension.config == nil then
      extension.config = function()
        require("telescope").load_extension(extension.name)
      end
    end
    table.insert(extensions, extension)
  end
end

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("lazy").setup(extensions)
  end
}
