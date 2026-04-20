local keymap = vim.keymap.set

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap("n", "<leader>w", "<cmd>write<CR>", { desc = "Write file" })
keymap("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })

keymap("n", "<C-w>", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
keymap("n", "<C-H>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<C-L>", "<cmd>bnext<CR>", { desc = "Next buffer" })

keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move to lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move to upper window" })

keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find project" })
keymap("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })

keymap("n", "<leader>tf", function()
  vim.g.format_on_save = vim.g.format_on_save == false and true or false
  vim.notify("Format on save: " .. (vim.g.format_on_save == false and "OFF" or "ON"))
end, { desc = "Toggle format on save" })

keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

keymap("n", "g/", function()
  local root = vim.fs.root(0, { ".git" }) or vim.uv.cwd()
  require("telescope.builtin").live_grep({ cwd = root })
end, { desc = "Global search (regex)" })
