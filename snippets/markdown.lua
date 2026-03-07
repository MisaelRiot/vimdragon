local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Snippet para matrices 3x3 (Álgebra Lineal)
  -- Escribe 'mat3' y presiona Tab
  s("mat3", {
    t("$$\\begin{pmatrix} "), 
    i(1, "a11"), t(" & "), i(2, "a12"), t(" & "), i(3, "a13"), t(" \\\\ "),
    i(4, "a21"), t(" & "), i(5, "a22"), t(" & "), i(6, "a23"), t(" \\\\ "),
    i(7, "a31"), t(" & "), i(8, "a32"), t(" & "), i(9, "a33"), t(" \\end{pmatrix}$$")
  }),

  -- Snippet para bloques de Mermaid (Networking/UML)
  -- Escribe 'merm' y presiona Tab
  s("merm", {
    t({"```mermaid", ""}),
    i(1, "graph TD;"),
    t({"", "```"}),
  }),

  -- Snippet para derivadas (Cálculo)
  s("deriva", {
    t("\\frac{d}{d"), i(1, "x"), t("} "), i(2, "f(x)")
  }),
}
