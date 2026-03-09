return {
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewFileHistory",
        },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
            { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History (current file)" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "File History (repo)" },
        },
        opts = {
            enhanced_diff_hl = true, -- better diff highlights
            view = {
                -- 3-way merge view for conflicts
                merge_tool = {
                    layout = "diff3_mixed",
                    disable_diagnostics = true,
                },
            },
        },
    },
}
