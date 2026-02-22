-- ~/.config/nvim/lua/plugins/themes.lua
return {
	-- ==========================================
	-- TEMA PRINCIPAL: NORDIC (Con fondo transparente)
	-- ==========================================
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			-- ¡Aquí activamos tu fondo transparente!
			transparent_bg = false,

			-- Hacemos que los menús flotantes (como los de Fzf-lua) también sean transparentes
			telescope = { style = "classic" }, -- Funciona similar para otros selectores
		},
		config = function(_, opts)
			require("nordic").setup(opts)
			vim.cmd.colorscheme("nordic")
		end,
	},

	-- ==========================================
	-- LA COLECCIÓN DE TEMAS (Para probar con <leader>fc)
	-- ==========================================

	-- Si quieres mantener Catppuccin como opción secundaria en tu menú
	{ "catppuccin/nvim", name = "catppuccin", lazy = true, opts = { transparent_background = true } },

	-- Nightfox (que incluye el sabor 'nordfox')
	{ "EdenEast/nightfox.nvim", lazy = true, opts = { options = { transparent = true } } },

	-- Otros clásicos por si te entra la curiosidad
	{ "folke/tokyonight.nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true },
}
