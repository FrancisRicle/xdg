local config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "nim", "tsx", "javascript", "astro" }
    })
end
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  ["config"] = config
}
