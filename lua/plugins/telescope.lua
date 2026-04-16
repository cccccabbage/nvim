require("telescope").setup({
  defaults = {
    preview = {
      treesitter = false,
    },
  },
})

require("telescope").load_extension("projects")

vim.keymap.set("n", "<C-p>", function()
  local root = vim.fs.root(0, { ".git" }) or vim.uv.cwd()
  require("telescope.builtin").find_files({ cwd = root })
end, { desc = "Find files from project root" })
