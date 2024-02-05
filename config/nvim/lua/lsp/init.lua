for file in vim.fs.dir(vim.fn.stdpath("config") .. "/lua/lsp") do
  if file ~= "init.lua" then
    local server = require("lsp." .. string.sub(file, 1, -5))
    require("lspconfig")[server.name].setup(server.config)
  end
end
