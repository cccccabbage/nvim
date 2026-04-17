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
| `todo-comments.nvim` | Highlight and search TODO/FIXME/HACK comments |
| `which-key.nvim` | Popup keybinding hints on partial key sequences |
| `nvim-lspconfig` | LSP client configuration |
| `nvim-autopairs` | Auto-close brackets/quotes |
| `nvim-cmp` + `LuaSnip` | Completion engine & snippets |

## Fuzzy Finder (Telescope)

Configured in `lua/plugins/telescope.lua`. Treesitter-based preview is disabled for performance.

| Keymap | Action |
|---|---|
| `<C-p>` | Find files from git root |
| `<leader>fp` | Find project (project.nvim integration) |
| `<leader>ft` | Find TODOs (todo-comments integration) |
| `g/` | Live grep from git root |

## Project & Session Management

Configured in `lua/plugins/project.lua`.

- **project.nvim** detects project roots via LSP and common marker files (`.git`, `Makefile`, `Cargo.toml`, etc.) and silently changes the working directory.
- **persisted.nvim** auto-saves and restores sessions per project directory.

## Git (gitsigns)

Configured in `lua/plugins/gitsigns.lua`. Adds git decorations in the sign column.

| Keymap | Action |
|---|---|
| `<leader>gb` | Blame current line (inline, non-full) |

## Hover

Configured in `lua/plugins/hover.lua`. Replaces the default `K` handler with `hover.nvim`, which unifies LSP hover and diagnostic info into a single rounded-border float. Bound to `K` via the LSP `on_attach` (see LSP section).

## LSP

Configured in `lua/plugins/lsp.lua`. Uses `nvim-lspconfig` with `cmp-nvim-lsp` capabilities.

**Configured servers:** `clangd`, `rust_analyzer`, `pyright`, `lua_ls`

| Keymap | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References (Telescope if available) |
| `gi` | Go to implementation |
| `K` | Hover (hover.nvim) |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action (normal & visual) |
| `<leader>h` | Toggle document highlight |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>e` | Open diagnostic float |

Format on save is enabled by default and can be toggled with `<leader>tf`.

## Completion (nvim-cmp)

Configured in `lua/plugins/cmp.lua`. Uses `nvim-cmp` with `LuaSnip` for snippets and `nvim-autopairs` for bracket auto-closing.

| Key | Action |
|---|---|
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<CR>` | Confirm selection |
| `<Tab>` / `<S-Tab>` | Navigate items or jump snippet placeholders |

## Keymaps

General keymaps defined in `lua/config/keymaps.lua`:

| Keymap | Action |
|---|---|
| `<Esc>` | Clear search highlight |
| `<leader>w` | Write file |
| `<leader>q` | Quit window |
| `<C-w>` | Close current buffer |
| `<C-H>` / `<C-L>` | Previous / next buffer |
| `<C-j>` / `<C-k>` | Move to lower / upper window |
| `<leader>tf` | Toggle format on save |
