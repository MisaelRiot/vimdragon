-- ~/.config/nvim/lua/plugins/noice.lua
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim", -- Motor de interfaces de usuario para Neovim
		"rcarriga/nvim-notify", -- Reemplaza los mensajes de texto por notificaciones flotantes tipo burbuja
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup", -- Aquí está la ventana flotante que viste en el video
		},
		messages = {
			enabled = true, -- Captura todos los mensajes nativos de Neovim y los hace bonitos
		},
		-- Presets modernos para tener la mejor experiencia desde el inicio
		presets = {
			bottom_search = false, -- Hace que las búsquedas con '/' también floten
			command_palette = true, -- Centra el popup del cmdline en la pantalla
			long_message_to_split = true, -- Mensajes largos se abren en un panel legible
			inc_rename = false,
			lsp_doc_border = true, -- Añade bordes a la documentación de los LSPs
		},
		-- Opcional: Integra las notificaciones de tu LSP (ej. "Pyright inicializando...")
		lsp = {
			progress = {
				enabled = true,
			},
			override = {
				-- Redirige los mensajes nativos del LSP hacia Noice
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
	},
}
