return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}
      opts.keymap.preset = "super-tab"
      opts.keymap["<CR>"] = { "cancel", "fallback" }
    end,
  },
}
