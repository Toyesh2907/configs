return {
    "folke/snacks.nvim",
    opts = {
        picker = {
            sources = {
                files = {
                    hidden = true,
                    ignored = true,
                    exclude = { "node_modules", "dist", "build" },
                },
                grep = {
                    hidden = true,
                    ignored = true,
                    exclude = { "node_modules", "dist", "build" },
                },
                explorer = {
                    layout = {
                        layout = {
                            position = "right",
                        },
                    },
                },
            },
            matcher = {
                fuzzy = true,
                smartcase = true,
                ignorecase = true,
                sort_empty = false,
                filename_bonus = true,
                file_pos = true,
                cwd_bonus = true,
                frecency = true,
                history_bonus = true,
            },
        },
    },
}
