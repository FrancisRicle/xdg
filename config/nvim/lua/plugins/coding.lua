return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { { "prettierd", "prettier" } },
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettierd",
					"prettier",
					"eslint_d",
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
			linters_by_ft = {
				fish = { "fish" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				astro = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			},
		},
		config = function(_, opts)
			local lint = require("lint")
			lint.linters_by_ft = opts.linters_by_ft
			vim.api.nvim_create_autocmd(opts.events, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
