return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	-- Cambiamos el 'build' por esto para que no intente reinstalar si ya lo hiciste manual
	build = "cd app && npm install",
	init = function()
		-- vim.g.mkdp_browser = "powershell.exe /c start"
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	config = function()
		vim.g.mkdp_preview_options = {
			mdown = {
				mermaid = { theme = "dark" },
			},
			katex = {},
		}
	end,
}
