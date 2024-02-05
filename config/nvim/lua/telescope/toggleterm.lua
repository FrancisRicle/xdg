return {
  "ryanmsnyder/toggleterm-manager.nvim",
  name = "toggleterm-manager",
  dependencies = {
    "akinsho/nvim-toggleterm.lua",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
  },
  config = function()
    require("toggleterm-manager").setup {
      titles = {
        prompt = "Pick Term",
        results = "Terminals"
      }
      -- more overrides if desired
    }
  end
}
