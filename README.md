# Dotfiles

Personal configuration files for Windows, managed via [Scoop](https://scoop.sh).

## Configs

| Config | Purpose |
|--------|---------|
| [WezTerm](#wezterm) | GPU-accelerated terminal emulator |
| [FastFetch](#fastfetch) | System info display (neofetch alternative) |
| [Neovim](#neovim) | Text editor (LazyVim-based) |
| [Oh My Posh](#oh-my-posh) | Shell prompt themes |
| [OpenCode](#opencode) | AI coding assistant CLI |
| [Scoop](#scoop) | Windows package manager |
| [Whkd](#whkd) | Window hotkey daemon |
| [YASB](#yasb) | Status bar for Windows |

---

## WezTerm

GPU-accelerated cross-platform terminal emulator.

**Config:** `.wezterm.lua`

**Key settings:**
- Font: JetBrainsMonoNL Nerd Font, size 12
- Color scheme: Catppuccin Macchiato
- Window opacity: 95%
- Front end: WebGpu
- Leader key: `Ctrl+b`

**Keybindings:**
- `Leader + c/x` - new/close tab
- `Leader + v/s` - split vertical/horizontal
- `Leader + h/j/k/l` - pane navigation

---

## FastFetch

Fast Neofetch-like system info display.

**Config:** `fastfetch/config.jsonc`

**Modules:** OS, Kernel, Packages, DE/WM, Theme, Icons, Terminal, Shell, Host, CPU, GPU, Memory, Uptime

**Logo:** DarkOS

---

## Neovim

Text editor with LazyVim framework.

**Config:** `nvim/`

**Base:**
- Plugin manager: lazy.nvim
- Colorscheme: Rose Pine (moon)
- Font: JetBrainsMonoNL Nerd Font
- Indentation: 4 spaces

**Key plugins:**
- `snacks.nvim` - dashboard, picker, utilities
- `diffview.nvim` - git diff viewer
- `vim-visual-multi` - multiple cursors
- `blink.cmp` - autocompletion
- `conform.nvim` - code formatting
- `nvim-lint` - linting
- `trouble.nvim` - diagnostics
- `persistence.nvim` - session management
- `gitsigns.nvim` - git integration

**Neovide settings:**
- Opacity: 0.93
- Cursor trail: enabled

---

## Oh My Posh

Shell prompt themes.

**Configs:** `oh-my-posh-themes/`

### custom_nordtron.omp.json
Nord-themed minimal prompt with session, git, time, Python, and Node segments.

### atomic.omp.json
Colorful multi-segment prompt with support for Node, Python, Java, Go, Rust, Dart, Ruby, battery, and more.

---

## OpenCode

AI-powered coding assistant CLI.

**Config:** `opencode/package.json`

**Dependency:** `@opencode-ai/plugin@1.2.27`

---

## Scoop

Windows command-line package manager.

**Config:** `scoop/config.json`

---

## Whkd

Hotkey daemon for Windows (works with Komorebi).

**Config:** `whkdrc`

**Keybindings:**
- `Alt + o` - reload whkd config
- `Alt + q/m` - close/minimize window
- `Alt + h/j/k/l` - focus pane
- `Alt + Shift + h/j/k/l` - move window
- `Alt + 1-8` - focus workspace
- `Alt + t` - toggle float
- `Alt + Shift + f` - toggle monocle

---

## YASB

Yet Another Status Bar for Windows (GlazeWM compatible).

**Config:** `yasb/config.yaml`

**Position:** Top, 34px height

**Widgets:**
- Left: GlazeWM workspaces, power menu, app launcher
- Center: Media player (title, thumbnail, controls)
- Right: Taskbar, clock (24h), bluetooth, volume, system tray

**Settings:**
- Blur effect: enabled
- Animation: enabled
- Clock format: `%H:%M %d.%m.%y`

---

## Installation

Clone to `~/.config`:

```bash
git clone https://github.com/your-username/dotfiles.git ~/.config
```

### Symlink configs

```powershell
# WezTerm
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.wezterm.lua" -Target "$env:USERPROFILE\.config\wezterm\.wezterm.lua"

# Whkd
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.whkdrc" -Target "$env:USERPROFILE\.config\whkdrc"

# Neovim
# Use dotbot or manual symlink

# FastFetch
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\fastfetch\config.jsonc" -Target "$env:USERPROFILE\.config\fastfetch\config.jsonc"

# Oh My Posh
oh-my-posh init pwsh --config "$env:USERPROFILE\.config\oh-my-posh-themes\custom_nordtron.omp.json"

# YASB
# Run via Python or configure as Windows scheduled task
```

### Install apps via Scoop

```powershell
scoop install wezterm neovim fastfetch oh-my-posh python nodejs git
scoop bucket add extras
scoop install yasb
```

### Install Neovim plugins

```bash
nvim --headless "+Lazy! sync" +qa
```
