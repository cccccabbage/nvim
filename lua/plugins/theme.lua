-- return {
--   "cpea2506/one_monokai.nvim",
--   config = function() require("one_monokai").setup { italics = false } end,
-- }

return {
  "uloco/bluloco.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  config = function()
    require("bluloco").setup({
      style = "auto",               -- "auto" | "dark" | "light"
    })
  end,
}