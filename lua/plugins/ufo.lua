require("ufo").setup({
  provider_selector = function(_, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})

vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zr", function()
  require("ufo").openFoldsExceptKinds()
end, { desc = "Open folds except kinds" })
vim.keymap.set("n", "zm", function()
  require("ufo").closeFoldsWith(vim.v.count1)
end, { desc = "Close folds with level" })
