return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                sources = {
                    files = {
                        -- show dotfiles
                        hidden = true,
                        -- show gitignored files too
                        ignored = true,
                        -- follow symlinks (optional)
                        follow = true,
                        -- optionally exclude only .git folder
                        exclude = { ".git", "node_modules" },
                    },
                },
            },
        },
    },
}
