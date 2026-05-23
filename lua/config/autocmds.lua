local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.filetype.add({
  extension = {
    cppm = "cpp",
    ixx = "cpp",
  },
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  callback = function()
    if vim.bo.buftype ~= "" then return end
    local buf_name = vim.api.nvim_buf_get_name(0)
    if buf_name == "" then return end

    local root = vim.fs.root(0, { ".git", "Makefile", "package.json", "Cargo.toml", "pyproject.toml" })
    if root and vim.fs.normalize(root) ~= vim.fs.normalize(vim.fn.getcwd()) then
      vim.api.nvim_set_current_dir(root)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  callback = function()
    if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.schedule(function()
        require("ufo").openAllFolds()
      end)
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

local is_session_loading = false
vim.api.nvim_create_autocmd("DirChanged", {
  group = augroup,
  pattern = "global",
  callback = function()
    if is_session_loading then
      return
    end

    local cwd = vim.fn.getcwd()
    
    local has_persisted, persisted = pcall(require, "persisted")
    if has_persisted then
      is_session_loading = true
      vim.schedule(function()
        pcall(function() persisted.load() end)
        vim.schedule(function() is_session_loading = false end)
      end)
    end

    if vim.o.exrc then
      local exrc_file = cwd .. "/.nvim.lua"
      if vim.uv.fs_stat(exrc_file) then
        local content = vim.secure.read(exrc_file)
        if content then
          local fn, err = loadstring(content)
          if fn then
            pcall(fn)
          else
            vim.notify("Error parsing .nvim.lua: " .. tostring(err), vim.log.levels.ERROR)
          end
        end
      end
    end
  end,
})
