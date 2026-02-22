-- ~/.config/nvim/lua/plugins/fzf.lua
return {
	"ibhagwan/fzf-lua",
	-- Carga devicons para que los resultados se vean con el logo de Python, PHP, etc.
	dependencies = { "nvim-tree/nvim-web-devicons" },

	-- Lazy-load: El plugin NO se cargará hasta que presiones uno de estos atajos
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Find Text (Ripgrep)" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find Buffers Active" },
		{ "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Símbolos del documento" },
		{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Find keymaps" },
        { "<leader>fc", "<cmd>FzfLua colorschemes<cr>", desc = "Change Theme" },
	},

	-- Configuración visual y de comportamiento
	opts = {
		winopts = {
			height = 0.85,
			width = 0.85,
			-- Estética de la ventana flotante
			border = "rounded",
			preview = {
				-- El layout cambia inteligentemente si tu terminal es muy estrecha
				layout = "flex",
				flip_columns = 120,
			},
		},
		-- Perfiles por defecto: maximiza la velocidad
		files = {
			-- Usa ripgrep (rg) para buscar archivos si está disponible
			cmd = "rg --files --hidden --glob '!.git/*'",
		},
		grep = {
			-- Configuración para la búsqueda de texto
			rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
		},
	},
}
