require("utils")
local config = function()
  modules("lsp", function(server) 
    if type(server) == "table" then
      require("lspconfig")[server[1]].setup(server.config)
    end
  end) 
end
return {
  "neovim/nvim-lspconfig",
  ["config"] = config
}
