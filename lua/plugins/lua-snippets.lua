-- En tu archivo de configuración de plugins (ej. snippets.lua)
return {
	"L3MON4D3/LuaSnip",
	version = "v2.*", -- Recomendado usar la versión estable
	config = function()
		local ls = require("luasnip")

		-- 2. Carga SOLO tus snippets personalizados desde tu carpeta de config
		-- Ajusta la ruta a donde prefieras guardar tus archivos .lua de snippets
		require("luasnip.loaders.from_lua").load({
			paths = { "~/.config/nvim/snippets/" },
		})

		-- Opcional: Configuración para que el salto de snippets no sea ruidoso
		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})
	end,
}
