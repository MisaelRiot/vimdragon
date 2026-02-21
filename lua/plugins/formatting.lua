return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  
  keys = {
    {
      "<leader>f",
      function()
	require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Formatear archivo o selección",
    },
  },

  -- Aquí ocurre la magia de procesar tu diccionario
  opts = function()
	local master_dict = require("core.formatters")

	local formatters_by_ft = {}
	local mason_tools_set = {} -- Usamos un 'set' (conjunto) para evitar duplicados

	-- Recorremos el diccionario maestro (como un for key, val in dict.items() en Python)
	for filetype, config in pairs(master_dict) do
		-- 1. Asignamos el comando al filetype para Conform
		formatters_by_ft[filetype] = config.cmd

		-- 2. Guardamos la herramienta de Mason (si existe)
		if config.mason then
			mason_tools_set[config.mason] = true
		end
	end

	-- Convertimos el 'set' de Mason de vuelta a una lista simple
	local mason_tools_list = {}
	for tool, _ in pairs(mason_tools_set) do
		table.insert(mason_tools_list, tool)
	end

	-- Retornamos los datos limpios y listos para usar
	return {
		mason_tools = mason_tools_list,
		conform_settings = {
			formatters_by_ft = formatters_by_ft,
		},
	}
  end,

  config = function(_, opts)
	require("mason-tool-installer").setup({
		ensure_installed = opts.mason_tools,
		auto_update = true,
	})

	require("conform").setup(opts.conform_settings)
  end,
}
