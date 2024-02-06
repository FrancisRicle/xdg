
return {
  "nvim-telescope/telescope-file-browser.nvim",
  name = "file-browser",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  telescope_config = {
    hijack_netrw = true,
  }
}
