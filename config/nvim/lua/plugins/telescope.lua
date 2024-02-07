local setup = {
	extensions = {
		file_browser = {
			hijack_netrw = true,
		},
		tailiscope = {
			register = "",
			default = "base",
		},
	},
}
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup(setup)
		end,
	},
	{
		"danielvolchek/tailiscope.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("tailiscope")
			vim.keymap.set("n", "<leader>fw", "<cmd>Telescope tailiscope<cr>")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"ryanmsnyder/toggleterm-manager.nvim",
		dependencies = {
			"akinsho/nvim-toggleterm.lua",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
		},
		config = function()
			local toggleterm_manager = require("toggleterm-manager")
			local actions = toggleterm_manager.actions
			toggleterm_manager.setup({
				mappings = { -- key mappings bound inside the telescope window
					i = {
						["<CR>"] = { action = actions.toggle_term, exit_on_action = true }, -- toggles terminal open/closed
						["<C-i>"] = { action = actions.create_term, exit_on_action = true }, -- creates a new terminal buffer
						["<C-d>"] = { action = actions.delete_term, exit_on_action = true }, -- deletes a terminal buffer
						["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
					},
				},
			})
		end,
	},
	{
		"piersolenski/telescope-import.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
}
