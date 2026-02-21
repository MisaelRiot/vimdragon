return {
    "saghen/blink.cmp",
    build = "cargo build --release",
    lazy = false,
    dependencies = {"rafamadriz/friendly-snippets"},
    opts = {
        keymap = {preset = "default"},
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        signature = {enabled = true}, -- for showing the function signature
        sources = {
            default = {"lsp", "path", "snippets", "buffer"},
        },
    },
}
