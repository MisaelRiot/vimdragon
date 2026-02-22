-- ~/.config/nvim/lua/plugins/octo.lua
return {
	"pwntester/octo.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua", -- Octo detectará y usará tu fzf-lua súper rápido
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "Octo", -- Lazy load absoluto
	keys = {
		{ "<leader>opl", "<cmd>Octo pr list<cr>", desc = "Listar Pull Requests (Octo)" },
		{ "<leader>ops", "<cmd>Octo pr search<cr>", desc = "Buscar PRs (Octo)" },
	},
	opts = {
		default_remote = { "origin", "upstream" },
		-- Le decimos explícitamente que use tu buscador ultra rápido
		picker = "fzf-lua",
		-- Evita que Octo modifique atajos de otros plugins a menos que estés en una pestaña de PR
		suppress_missing_scope = {
			projects_v2 = true,
		},
	},
}
