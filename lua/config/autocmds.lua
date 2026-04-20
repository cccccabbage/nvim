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

-- Safety net for mixed line endings: if dos is the preferred fileformat
-- but a file was read as unix with trailing \r, re-read as dos (no modified flag).
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function(args)
    if vim.bo[args.buf].fileformat ~= "unix" then return end
    if not vim.o.fileformats:match("^dos") then return end
    local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
    for _, line in ipairs(lines) do
      if line:sub(-1) == "\r" then
        vim.cmd("edit ++ff=dos")
        return
      end
    end
  end,
})
