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
