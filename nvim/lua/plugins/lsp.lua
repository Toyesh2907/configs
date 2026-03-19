return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "C:/Program Files/LLVM/bin/clangd.exe",
                        "--background-index",
                        "--clang-tidy",
                        "--completion-style=detailed",
                        "--header-insertion=never",
                        "--pch-storage=memory",
                        "--all-scopes-completion",
                    },
                    init_options = {
                        clangdFileStatus = true,
                    },
                },
            },
        },
    },
}
