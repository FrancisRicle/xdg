local config = function()
  require("neoconf").setup()
end
return { "folke/neoconf.nvim", cmd = "Neoconf", lazy = false, ["config"] = config }
