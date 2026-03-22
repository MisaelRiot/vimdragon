return {
	"nvzone/floaterm",
	dependencies = "nvzone/volt",
	keys = {
		{
			"<leader>trm",
            "<cmd>FloatermToggle<CR>",
			mode = { "n", "t" },
			desc = "FloatTerm: Toggle Terminal",
		},
	},
	opts = {},
	cmd = "FloatermToggle",
}
