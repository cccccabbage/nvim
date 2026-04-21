-- Install and load plugins via Neovim's built-in plugin manager (vim.pack).
-- Requires Neovim 0.12+.
vim.pack.add({
  { src = "https://github.com/olimorris/onedarkpro.nvim" },

  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },

  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/ahmedkhalf/project.nvim" },
  { src = "https://github.com/olimorris/persisted.nvim" },

  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/kdheepak/lazygit.nvim" },
  { src = "https://github.com/lewis6991/hover.nvim" },

  { src = "https://github.com/mg979/vim-visual-multi" },

  { src = "https://github.com/neovim/nvim-lspconfig" },

  { src = "https://github.com/windwp/nvim-autopairs" },

  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/folke/which-key.nvim" },

  { src = "https://github.com/mikavilpas/yazi.nvim" },

  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-cmdline" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },
})

require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.project")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.lazygit")
require("plugins.hover")
require("plugins.multicursor")
require("plugins.todo-comments")
require("plugins.which-key")
require("plugins.cmp")
require("plugins.lsp")
require("plugins.yazi")
