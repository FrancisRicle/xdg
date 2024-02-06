local config = function()
  require("toggleterm").setup({
    direction = "tab",
    winbar = {
      enabled = false
    }
  })
end
return {
  "akinsho/toggleterm.nvim",
  ["config"] = config
}
