return {
    "folke/snacks.nvim",
    opts = {
        picker = {
            sources = {
                files = {
                    hidden = true, -- include hidden/dotfiles
                    ignored = true, -- include gitignored files
                    exclude = { "node_modules", "dist", "build" },
                },
                grep = {
                    hidden = true,
                    ignored = true,
                    exclude = { "node_modules", "dist", "build" },
                },
            },
            matcher = {
                fuzzy = true, -- fuzzy matching (default: true, set false for exact)
                smartcase = true, -- case insensitive unless you type uppercase
                ignorecase = true, -- ignore case
                sort_empty = false, -- sort results even when search string is empty
                filename_bonus = true, -- boost matches in filenames over full paths
                file_pos = true, -- support `file:line:col` pattern
                cwd_bonus = true, -- boost files in cwd
                frecency = true, -- boost frequently/recently used files
                history_bonus = true, -- boost chronologically ordered results
            },
        },
    },
}
