-- ~/.config/nvim/lua/plugins/diffview.lua
return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- Lazy-load: Solo se carga cuando ejecutas un comando de Diffview
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview (Git Diff)" },
		{ "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
		-- Este atajo es oro puro: revisa el historial de commits del archivo actual
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
	},
	opts = {
		-- Configuración visual mejorada
		enhanced_diff_hl = true,
		view = {
			-- Usa el layout de 3 vías automáticamente para conflictos de merge
			merge_tool = { layout = "diff3_mixed", disable_diagnostics = true },
		},
	},
}
