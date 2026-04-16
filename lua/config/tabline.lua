local function buffer_name(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == "" then
    name = "[No Name]"
  else
    name = vim.fn.fnamemodify(name, ":t")
  end

  if vim.bo[bufnr].modified then
    name = name .. " +"
  end

  return name
end

function _G.user_tabline_switch(bufnr)
  if vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_set_current_buf(bufnr)
  end
end

function _G.user_tabline()
  local current = vim.api.nvim_get_current_buf()
  local parts = {}

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[bufnr].buflisted then
      local hl = bufnr == current and "%#TabLineSel#" or "%#TabLine#"
      parts[#parts + 1] = string.format("%s%%%d@v:lua.user_tabline_switch@ %s %%X", hl, bufnr, buffer_name(bufnr))
    end
  end

  parts[#parts + 1] = "%#TabLineFill#%="
  return table.concat(parts)
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.user_tabline()"
