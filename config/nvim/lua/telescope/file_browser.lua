
return {
  "nvim-telescope/telescope-file-browser.nvim",
  name = "file-browser",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = {
    hijack_netrw = true,
  }
}
