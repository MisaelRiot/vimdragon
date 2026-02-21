-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
      sort_by = "case_sensitive",
      view = {
        width = 30,
        relativenumber = true, -- Para que puedas moverte con saltos (ej: 5j)
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false, -- Para que puedas ver tus .env o .python-version
      },
  }
}
