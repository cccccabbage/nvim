local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({
  float = { border = "rounded" },
})

local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  map("n", "gd", vim.lsp.buf.definition, "LSP definition")
  map("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
  map("n", "gr", function()
    local ok, builtin = pcall(require, "telescope.builtin")
    if ok then
      builtin.lsp_references()
      return
    end
    vim.lsp.buf.references()
  end, "LSP references")
  map("n", "gi", vim.lsp.buf.implementation, "LSP implementation")
  map("n", "K", require("hover").hover, "LSP hover + diagnostics")
  map("n", "<leader>rn", vim.lsp.buf.rename, "LSP rename")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP code action")
  local hl_enabled = false
  map("n", "<leader>h", function()
    if hl_enabled then
      vim.lsp.buf.clear_references()
    else
      vim.lsp.buf.document_highlight()
    end
    hl_enabled = not hl_enabled
  end, "Toggle LSP highlight")

  map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
  map("n", "<leader>e", vim.diagnostic.open_float, "Line diagnostics")

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      if vim.g.format_on_save ~= false then
        vim.lsp.buf.format({ bufnr = bufnr })
      end
    end,
  })
end

local servers = {
  clangd = {
    cmd = { "clangd" },
  },
  rust_analyzer = {},
  pyright = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("", true),
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
}

for server, server_opts in pairs(servers) do
  server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
  server_opts.on_attach = on_attach
  vim.lsp.config(server, server_opts)
  vim.lsp.enable(server)
end
