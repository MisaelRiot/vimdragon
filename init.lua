if vim.loader then
	vim.loader.enable()
end
require("core.options")
require("core.keymaps")

-- LazyVim -> pluging manager.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- Esto buscará automáticamente en lua/plugins/
require("lazy").setup("plugins")
require("core.autocmds")
