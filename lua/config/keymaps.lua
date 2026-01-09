-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Move to window
map("n", "<A-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<A-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<A-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
map("n", "<A-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })

-- disable buffer prev/next on Shift-h / Shift-l
del("n", "<S-h>")
del("n", "<S-l>")

-- Map Ctrl+p to Find Files (like VSCode)
map("n", "<C-p>", function() LazyVim.pick("files")() end, { desc = "Find Files" })
-- Disable default find files keymaps
del("n", "<leader>ff")
del("n", "<leader><space>")

-- Disable default window navigation keymaps
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")
