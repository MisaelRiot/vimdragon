-- ~/.config/nvim/lua/plugins/fugitive.lua
return {
	"tpope/vim-fugitive",
	-- Carga perezosa: solo se activa si escribes un comando de Git o usas el atajo
	cmd = { "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gblame", "Gwrite" },
	keys = {
		-- El atajo principal para abrir la ventana de estado rápida de Fugitive
		{ "<leader>gs", "<cmd>Git<cr>", desc = "Git Status (Fugitive)" },
	},
}
