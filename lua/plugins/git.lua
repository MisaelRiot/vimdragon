-- ~/.config/nvim/lua/plugins/git.lua
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Carga perezosa al abrir archivos

	opts = {
		-- Iconos modernos para la columna izquierda
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},

		-- Gitsigns tiene una función especial 'on_attach' que inyecta atajos
		-- SOLO si el archivo actual pertenece a un repositorio de Git.
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

			-- Navegación rápida entre cambios
			map("n", "]h", gs.next_hunk, "Next git change (Hunk)")
			map("n", "[h", gs.prev_hunk, "Previous git change (Hunk)")

			-- Acciones clave
			map("n", "<leader>hs", gs.stage_hunk, "Stage git change (Stage Hunk)")
			map("n", "<leader>hr", gs.reset_hunk, "Reset git change (Reset Hunk)")
			map("n", "<leader>hp", gs.preview_hunk, "Diff git change (Preview Hunk)")
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Who did it (Blame)")
			map("n", "<leader>hd", gs.diffthis, "Whole file git diff")
		end,
	},
}
