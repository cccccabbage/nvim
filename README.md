# Neovim Configuration

A personal Neovim config built on Neovim 0.12+ using the built-in `vim.pack` plugin manager.

## Options

Standard editor options set in `lua/config/options.lua`:

- Line numbers with relative numbering
- System clipboard integration (`unnamedplus`)
- 2-space indentation with smart indent
- Case-insensitive search with smart case override
- Splits open right and below
- 8-line scroll offset (vertical and horizontal)
- No line wrap
- `updatetime = 250`, `timeoutlen = 300`

## Plugin Manager

Uses Neovim 0.12+'s built-in `vim.pack` manager (`lua/config/plugins.lua`). No external bootstrapping required — plugins are declared with `vim.pack.add({ src = "..." })` and locked via `nvim-pack-lock.json`.

**Plugins included:**

| Plugin | Purpose |
|---|---|
| `onedarkpro.nvim` | Colorscheme |
| `nvim-treesitter` | Syntax highlighting & parsing |
| `telescope.nvim` + `plenary.nvim` | Fuzzy finder |
| `project.nvim` + `persisted.nvim` | Project detection & session management |
| `gitsigns.nvim` | Git decorations & hunk actions |
| `hover.nvim` | Unified hover (LSP + diagnostics) |
| `vim-visual-multi` | Multiple cursors |
| `nvim-lspconfig` | LSP client configuration |
| `nvim-autopairs` | Auto-close brackets/quotes |
| `nvim-cmp` + `LuaSnip` | Completion engine & snippets |

## Fuzzy Finder (Telescope)

Configured in `lua/plugins/telescope.lua`. Treesitter-based preview is disabled for performance.

| Keymap | Action |
|---|---|
| `<C-p>` | Find files from git root |
| `<leader>fp` | Find project (project.nvim integration) |
| `g/` | Live grep from git root |

## Project & Session Management

Configured in `lua/plugins/project.lua`.

- **project.nvim** detects project roots via LSP and common marker files (`.git`, `Makefile`, `Cargo.toml`, etc.) and silently changes the working directory.
- **persisted.nvim** auto-saves and restores sessions per project directory. Sessions are loaded automatically when a project is opened via project.nvim.
