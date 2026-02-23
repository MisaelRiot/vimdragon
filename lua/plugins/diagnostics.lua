return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		opts = {
			preset = "nerdfont",
			virt_texts = { priority = 9999 },
		},
		config = function(_, opts)
			require("tiny-inline-diagnostic").setup(opts)
			vim.diagnostic.config({ virtual_text = false })
		end,
		keys = {
			{
				"<leader>dd",
				function()
					require("tiny-inline-diagnostic").toggle()
				end,
				desc = "[diagnostics] Toggle inline",
			},
			{
				"<leader>dn",
				function()
					vim.diagnostic.jump({ count = 1, float = true })
				end,
				desc = "[diagnostics] Next error/warning",
			},
			{
				"<leader>dN",
				function()
					vim.diagnostic.jump({ count = -1, float = true })
				end,
				desc = "[diagnostics] Previous error/warning",
			},
			{
				"<leader>de",
				function()
					vim.diagnostic.open_float({ border = "rounded" })
				end,
				desc = "[diagnostics] Show error details",
			},
			{
				"<leader>dl",
				function()
					vim.diagnostic.setloclist()
				end,
				desc = "[diagnostics] Document list",
			},
			{
				"<leader>dL",
				function()
					vim.diagnostic.setqflist()
				end,
				desc = "[diagnostics] Project quickfix",
			},
			{
				"<leader>dE",
				function()
					vim.diagnostic.config({
						virtual_text = { severity = vim.diagnostic.severity.ERROR },
					})
					vim.notify("[diagnostics] Showing errors only", vim.log.levels.INFO)
				end,
				desc = "[diagnostics] Filter errors only",
			},
			{
				"<leader>dA",
				function()
					vim.diagnostic.config({ virtual_text = false })
					vim.notify("[diagnostics] Showing all levels", vim.log.levels.INFO)
				end,
				desc = "[diagnostics] Show all levels",
			},
			{
				"<leader>dc",
				function()
					local count = #vim.diagnostic.get(0)
					vim.notify(string.format("[diagnostics] %d issues in this file", count), vim.log.levels.INFO)
				end,
				desc = "[diagnostics] Count in file",
			},
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		cmd = { "Trouble" },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "[diagnostics] Trouble toggle",
			},
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "[diagnostics] Trouble document",
			},
			{
				"<leader>xl",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "[diagnostics] Trouble location list",
			},
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "[diagnostics] Trouble quickfix",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				python = { "ruff" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
