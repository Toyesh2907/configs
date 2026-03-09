-- Set your preferred colorscheme here
local COLORSCHEME = "rose-pine" -- Options: "catppuccin", "gruvbox", "onedark", "tokyodark", "bamboo", "rose-pine"

local colorschemes = {
    catppuccin = {
        {
            "catppuccin/nvim",
            name = "catppuccin",
            opts = {
                flavour = "macchiato",
                transparent_background = true,
                integrations = {
                    telescope = true,
                    native_lsp = {
                        enabled = true,
                    },
                },
            },
        },
    },

    gruvbox = {
        {
            "ellisonleao/gruvbox.nvim",
            opts = {
                contrast = "soft",
                transparent_mode = true,
                integrations = {
                    telescope = true,
                    native_lsp = true,
                },
            },
        },
    },

    onedark = {
        {
            "navarasu/onedark.nvim",
            priority = 1000,
            opts = {
                style = "darker",
                transparent = true,
                term_colors = true,
            },
        },
    },

    tokyodark = {
        {
            "tiagovla/tokyodark.nvim",
            priority = 1000,
            opts = {
                transparent_background = true,
                gamma = 1.0,
            },
        },
    },

    bamboo = {
        {
            "ribru17/bamboo.nvim",
            priority = 1000,
            opts = {},
        },
    },

    ["rose-pine"] = {
        {
            "rose-pine/neovim",
            name = "rose-pine",
            priority = 1000,
            opts = {
                variant = "moon", -- main, moon, dawn
                dark_variant = "moon",
                disable_background = true,
                disable_float_background = true,
                disable_italics = false,
            },
        },
    },
}

-- Get the selected colorscheme configuration
local selected = colorschemes[COLORSCHEME] or colorschemes.bamboo

-- Add LazyVim colorscheme + transparent cursorline configuration
table.insert(selected, {
    "LazyVim/LazyVim",
    opts = function(_, opts)
        opts.colorscheme = COLORSCHEME
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function()
                vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
            end,
        })
    end,
})

return selected
