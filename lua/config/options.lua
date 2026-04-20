local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.termguicolors = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.wrap = false
opt.textwidth = 0

-- Follow git's line-ending policy for fileformat detection order.
-- core.autocrlf=true     → working tree is CRLF, prefer dos
-- core.autocrlf=input    → working tree is LF, prefer unix
-- otherwise              → leave Neovim's platform default
local autocrlf = vim.trim(vim.fn.system({ "git", "config", "--get", "core.autocrlf" }))
if vim.v.shell_error == 0 then
  if autocrlf == "true" then
    opt.fileformats = "dos,unix"
  elseif autocrlf == "input" then
    opt.fileformats = "unix,dos"
  end
end

opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect"
