local keymap = vim.keymap.set

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap("n", "<leader>w", "<cmd>write<CR>", { desc = "Write file" })
keymap("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })

keymap("n", "<C-w>", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
keymap("n", "<C-H>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<C-L>", "<cmd>bnext<CR>", { desc = "Next buffer" })

keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move to lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move to upper window" })
