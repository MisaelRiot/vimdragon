-- ~/.config/nvim/lua/plugins/folding.lua
return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async", -- Dependencia necesaria para que UFO vuele en segundo plano
  },
  event = "BufReadPost", -- Que cargue al abrir un archivo para no retrasar el inicio
  
  -- La función 'init' de Lazy se ejecuta ANTES de que el plugin cargue.
  -- Usamos esto para preparar el terreno nativo de Neovim.
  init = function()
    vim.o.foldcolumn = "1" -- Agrega una pequeña columna a la izquierda para los iconos (+/-)
    vim.o.foldlevel = 99 -- Por defecto, que todo el código esté expandido al abrir
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true -- Habilitar el sistema de folding
  end,

  -- Opciones de UFO
  opts = {
    -- Le decimos que use tu LSP (Pyright, Intelephense) como fuente principal para saber 
    -- dónde empieza y termina una función. Si falla, usa la indentación.
    provider_selector = function(bufnr, filetype, buftype)
      return { "lsp", "indent" }
    end,
  },

  -- Atajos de teclado para manejar los bloques
  keys = {
    {
      "zR",
      function() require("ufo").openAllFolds() end,
      desc = "Unfold All",
    },
    {
      "zM",
      function() require("ufo").closeAllFolds() end,
      desc = "Fold All",
    },
    {
      "K",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover() -- Si no hay un bloque cerrado, usa el 'K' normal del LSP
        end
      end,
      desc = "Closed Block Preview or Hover LSP",
    },
  },
}
