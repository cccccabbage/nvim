require("project_nvim").setup({
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "pyproject.toml" },
  silent_chdir = true,
  on_load_project = function()
    require("persisted").load()
  end,
})

require("persisted").setup({
  autostart = true,
  autoload = true,
  on_autoload_no_session = function()
    -- no previous session for this directory, start fresh
  end,
})
