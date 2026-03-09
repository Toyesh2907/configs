-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation
vim.opt.softtabstop = 4 -- Number of spaces tab counts for in insert mode
vim.g.snacks_animate_scroll = false

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block-blinkon500-blinkoff500-blinkwait300,r-cr-o:hor50"

if vim.g.neovide then
    -- Font (matching your WezTerm setup)
    vim.o.guifont = "JetBrainsMonoNL Nerd Font:h12"

    -- Transparency (matching your 0.93 wezterm opacity)
    vim.g.neovide_opacity = 0.93

    -- Cursor animations
    vim.g.neovide_cursor_animation_length = 0.1
    vim.g.neovide_cursor_trail_size = 0.5

    -- Scroll animation
    vim.g.neovide_scroll_animation_length = 0.3

    -- Padding (matching your wezterm window_padding)
    vim.g.neovide_padding_top = 2
    vim.g.neovide_padding_bottom = 2
    vim.g.neovide_padding_left = 2
    vim.g.neovide_padding_right = 2

    -- Background image (matching your wezterm wallpaper)
    -- vim.g.neovide_background_image = "C:/Users/kunwa/Downloads/wallhaven-76edpv_1920x1080.png"
end
