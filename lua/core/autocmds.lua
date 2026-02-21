-- ~/.config/nvim/lua/core/autocmds.lua

local autocmd = vim.api.nvim_create_autocmd

-- Recordar la última posición del cursor, pero con manejo de errores
autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if line > 1 and line <= vim.fn.line("$") then
			-- El pcall evita que el error bloquee tu pantalla si algo falla
			pcall(vim.api.nvim_command, "normal! g'\"")
		end
	end,
})
