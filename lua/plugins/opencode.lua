-- Agrega esto a tu configuración de plugins
return {
	"sudo-tee/opencode.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			event = "VeryLazy",
			opts = {
				anti_conceal = { enabled = false },
				file_types = { "markdown", "opencode_output" },
			},
		},
	},
	opts = {
		default_mode = "build",
		ui = {
			position = "right",
			window_width = 0.40,
			display_model = true,
			display_context_size = true,
			display_cost = true,
		},
	},
	keys = {
		{ "<leader>oc", "<cmd>Opencode<cr>", desc = "OpenCode: Toggle chat", mode = { "n", "v" } },
		{ "<leader>of", function()
			local fzf = require("fzf-lua")
			fzf.files({
				prompt = "Contexto IA> ",
				fzf_opts = { ["--multi"] = true },
				actions = {
					["default"] = function(selected)
						if #selected > 0 then
							local files = {}
							for _, file in ipairs(selected) do
								table.insert(files, file:match("[^:]*"))
							end
							local files_str = table.concat(files, " ")
							vim.cmd("OpenCodeChat " .. files_str)
							vim.notify("Contexto IA: " .. #selected .. " archivo(s) añadido(s)", vim.log.levels.INFO)
						end
					end,
				},
			})
		end, desc = "OpenCode: Seleccionar contexto con FZF", mode = "n" },

		{ "<leader>op", "<cmd>Opencode configure provider<cr>", desc = "OpenCode: Provider/Model picker" },
		{ "<leader>oV", "<cmd>Opencode variant<cr>", desc = "OpenCode: Model variant" },
		{ "<leader>ot", "<cmd>Opencode toggle focus<cr>", desc = "OpenCode: Toggle focus" },
		{ "<leader>os", "<cmd>Opencode session select<cr>", desc = "OpenCode: Select session" },
		{ "<leader>oT", "<cmd>Opencode timeline<cr>", desc = "OpenCode: Timeline picker" },
		{ "<leader>oq", "<cmd>Opencode close<cr>", desc = "OpenCode: Close" },
		{ "<leader>o/", "<cmd>Opencode quick_chat<cr>", desc = "OpenCode: Quick chat", mode = { "n", "x" } },
		{ "<leader>od", "<cmd>Opencode diff open<cr>", desc = "OpenCode: Diff view" },
		{ "<leader>o]", "<cmd>Opencode diff next<cr>", desc = "OpenCode: Next diff" },
		{ "<leader>o[", "<cmd>Opencode diff prev<cr>", desc = "OpenCode: Prev diff" },
	},
}
