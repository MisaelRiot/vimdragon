-- Agrega esto a tu configuración de plugins
return {
	"sudo-tee/opencode.nvim",
	opts = {
		provider = "gemini-1.5-flash", -- o "gemini"
		model = "gemini-1.5-flash", -- o "gemini-1.5-pro"
		cli_args = { "--model", "gemini-1.5-flash" },
		-- Configuración de la ventana

		window = {
			type = "float", -- Aquí defines que sea un pop-up
			relative = "editor",
			width = 0.8, -- 80% del ancho
			height = 0.8, -- 80% del alto
			border = "rounded", -- Estética limpia
		},
	},
	keys = {
		-- 1. Atajo básico para abrir el pop-up (disponible en modo Normal y Visual)
		{
			"<leader>oc",
			"<cmd>OpenCodeChat<CR>",
			desc = "OpenCode: Abrir chat",
			mode = { "n", "v" },
		},

		-- 2. Atajo avanzado integrando fzf-lua directamente aquí
		{
			"<leader>of",
			function()
				local fzf = require("fzf-lua")
				fzf.files({
					prompt = "Contexto IA> ",
					fzf_opts = { ["--multi"] = true }, -- Permite seleccionar varios archivos con Tab
					actions = {
						["default"] = function(selected)
							if #selected > 0 then
								local files = {}
								for _, file in ipairs(selected) do
									-- Limpiamos el output de fzf
									table.insert(files, file:match("[^:]*"))
								end

								local files_str = table.concat(files, " ")
								-- Enviamos los archivos seleccionados al comando de OpenCode
								vim.cmd("OpenCodeChat " .. files_str)

								vim.notify(
									"Contexto IA: " .. #selected .. " archivo(s) añadido(s)",
									vim.log.levels.INFO
								)
							end
						end,
					},
				})
			end,
			desc = "OpenCode + FZF: Seleccionar contexto",
			mode = "n",
		},
	},
}
