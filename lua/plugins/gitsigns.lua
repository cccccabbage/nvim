require("gitsigns").setup({
  current_line_blame = false,
  preview_config = {
    border = "rounded",
  },
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    map("n", "<leader>gb", function() gs.blame_line({ full = false }) end, "Git blame line")
  end,
})
