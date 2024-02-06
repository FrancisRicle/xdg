local config = function()
  require("telescope").load_extension("import")
end
return {
  "piersolenski/telescope-import.nvim",
  ["config"] = config
}
