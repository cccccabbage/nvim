require("persisted").setup({
  autostart = true,
  autoload = true,
  on_autoload_no_session = function()
    -- no previous session for this directory, start fresh
  end,
})
