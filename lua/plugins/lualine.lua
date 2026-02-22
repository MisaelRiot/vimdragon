-- ~/.config/nvim/lua/plugins/lualine.lua
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- Evento VeryLazy para que cargue justo después de que la pantalla se dibuja,
	-- sin afectar el tiempo de inicio.
	event = "VeryLazy",

	opts = {
		options = {
			-- 'auto' detecta mágicamente si estás usando Nordic, Catppuccin o Tokyonight
			-- y adapta los colores de la barra automáticamente
			theme = "auto",

			-- Usamos bordes redondeados modernos para separar las secciones
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },

			-- Hacemos que la barra global sea una sola, no una por cada ventana dividida
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" }, -- NORMAL, INSERT, VISUAL
			lualine_b = {
				"branch",
				"diff",
				"diagnostics", -- Aquí se conectan los errores de tu LSP y Blink
			},
			lualine_c = {
				-- Muestra el nombre del archivo y la ruta relativa
				{ "filename", path = 1 },
			},
			lualine_x = {
				"encoding",
				"fileformat",
				"filetype", -- Te pondrá el icono de Python o PHP
			},
			lualine_y = { "progress" }, -- Porcentaje del archivo
			lualine_z = { "location" }, -- Fila y columna
		},
	},
}
