require("snacks").setup({
  picker = {
    enabled = true,
    layout = { preset = "vertical" },
  },
  terminal = {
    enabled = true,
    shell = "nu",
    win = {
      style = "terminal",
      position = "float",
      border = "rounded",
      width = 0.9,
      height = 0.85,
    },
  },
})
