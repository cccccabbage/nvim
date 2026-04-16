local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.filetype.add({
  extension = {
    cppm = "cpp",
    ixx = "cpp",
  },
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})
