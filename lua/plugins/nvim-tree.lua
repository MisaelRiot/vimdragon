-- ~/.config/nvim/lua/plugins/nvim-tree.lua
-- this is the side pannel.
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
        {"\\", ":NvimTreeToggle<CR>", desc = "Open/Close File Explorer" },
	},
	opts = {
		sort_by = "case_sensitive",
		view = {
			width = 30,
			relativenumber = true, -- Para que puedas moverte con saltos (ej: 5j)
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false, -- Para que puedas ver tus .env o .python-version
		},
	},
}
