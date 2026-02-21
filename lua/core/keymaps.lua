vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap
keymap.set("n", "<Esc>", ":noh<CR>", {desc="Clears search result"})
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
keymap.set("n", "\\", ":NvimTreeToggle<CR>", { desc = "Open/Close File Explorer" })
