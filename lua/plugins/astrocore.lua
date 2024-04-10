-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
      wo = {
        colorcolumn = "100", -- sets vim.wo.colorcolumn
      }
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<A-h>"] = { "<C-w>h", desc = "Move to left split" },
        ["<A-j>"] = { "<C-w>j", desc = "Move to below split" },
        ["<A-k>"] = { "<C-w>k", desc = "Move to above split" },
        ["<A-l>"] = { "<C-w>l", desc = "Move to right split" },

        ["<C-l>"] = {
          function() require("astrocore.buffer").nav(vim.v.count1) end,
          desc = "Next buffer",
        },
        ["<C-h>"] = {
          function() require("astrocore.buffer").nav(-vim.v.count1) end,
          desc = "Previous buffer",
        },

        ["<C-p>"] = {
          function() require("telescope.builtin").find_files() end, desc = "Find files",
        },

        ["<Leader>a"] = {"<cmd>AerialToggle!<CR>", desc = "Toggle Aerial"},
      },
      t = {
        ["<A-h>"] = { "<Cmd>wincmd h<CR>", desc = "Terminal left window navigation" },
        ["<A-j>"] = { "<Cmd>wincmd j<CR>", desc = "Terminal down window navigation" },
        ["<A-k>"] = { "<Cmd>wincmd k<CR>", desc = "Terminal up window navigation" },
        ["<A-l>"] = { "<Cmd>wincmd l<CR>", desc = "Terminal right window navigation" },
      },
    },
  },
}
