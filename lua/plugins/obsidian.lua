return {
	"epwalsh/obsidian.nvim",
	version = "*", -- Usa la última versión estable
	lazy = true,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		workspaces = {
			{
				name = "ingenieria",
				path = "/mnt/c/Users/misae/Documents/Study/Notes/Software_Complete/",
			},
		},
		-- Esto hace que las notas se vean limpias en Neovim
		ui = { enable = true },
	},
}
