return {
	"saghen/blink.cmp",
	build = "cargo build --release",
	lazy = false,
	dependencies = { { "L3MON4D3/LuaSnip", version = "v2.*" }, "rafamadriz/friendly-snippets" },
	opts = {
		keymap = { preset = "default" },
		snippets = {
			preset = "luasnip",
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = { enabled = true }, -- for showing the function signature
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	config = function(_, opts)

		-- Cargamos los snippets de la comunidad (friendly)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Cargamos tus snippets de Ingeniería/Matemáticas (de tu carpeta local)
		require("luasnip.loaders.from_lua").load({
			paths = { "~/.config/nvim/snippets/" },
		})

		-- Iniciamos Blink con las opciones que definimos arriba
		require("blink.cmp").setup(opts)
	end,
}
