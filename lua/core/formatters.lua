return {
	lua = {
		mason = "stylua",
		cmd = { "stylua" },
	},
	python = {
		mason = "ruff",
		cmd = { "ruff_format", "ruff_fix" },
	},
	php = {
		mason = "php-cs-fixer", -- Nombre del paquete a descargar
		cmd = { "php_cs_fixer" }, -- Nombre del comando a ejecutar
	},
	javascript = {
		mason = "prettier",
		cmd = { "prettier" },
	},
	typescript = {
		mason = "prettier",
		cmd = { "prettier" },
	},
}
