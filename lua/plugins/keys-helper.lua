-- ~/.config/nvim/lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- No lo necesitamos en el milisegundo 1, que cargue después
  opts = {
    -- La configuración por defecto ya es perfecta, pero aquí podrías
    -- agrupar menús si quisieras (ej: "Buscar", "LSP", "Git")
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Show local keymaps (Buffer)",
    },
  },
}
