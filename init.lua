-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.g.neovide_position_animation_length = 0.03
  vim.g.neovide_scroll_animation_length = 0.3
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
end
