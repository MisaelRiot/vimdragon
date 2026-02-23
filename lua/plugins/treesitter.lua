-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
      ensure_installed = { "lua", "vim", "vimdoc", "python", "php", "javascript", "typescript", "markdown" },
      highlight = {
        enable = true, -- Esto activa el resaltado pro
      },
      indent = {
        enable = true, -- Esto mejora la indentación automática
      },
  }
}

