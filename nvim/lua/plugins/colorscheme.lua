return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            transparent_background = true,

            integrations = {
                telescope = true,
                native_lsp = {
                    enabled = true,
                },
            },
        },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
-- return {
--     {
--         "ellisonleao/gruvbox.nvim",
--         opts = {
--             contrast = "soft", -- hard, soft, or empty
--             transparent_mode = true,
--             integrations = {
--                 telescope = true,
--                 native_lsp = true,
--             },
--         },
--     },
--
--     {
--         "LazyVim/LazyVim",
--         opts = {
--             colorscheme = "gruvbox",
--         },
--     },
-- }
