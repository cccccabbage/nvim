vim.keymap.set({ "n", "x" }, "gl", "<Plug>(VM-Find-Under)<Plug>(VM-Find-Under)", {
  remap = true,
  silent = true,
  desc = "Select word and next occurrence",
})

vim.keymap.set({ "n", "x" }, "ga", "<Plug>(VM-Select-All)", {
  remap = true,
  silent = true,
  desc = "Select all occurrences of word under cursor",
})
