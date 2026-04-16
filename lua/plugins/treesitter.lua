require("nvim-treesitter").setup({
  ensure_installed = {
    "c",
    "cpp",
    "rust",
    "python",
    "lua",
    "vim",
    "vimdoc",
    "query",
  },
  highlight = { enable = true },
  indent = { enable = true },
})
