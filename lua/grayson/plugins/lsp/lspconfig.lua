return {
"neovim/nvim-lspconfig",
event = { "BufReadPre", "BufNewFile" },
dependencies = {
"hrsh7th/cmp-nvim-lsp",
{ "antosha417/nvim-lsp-file-operations", config = true },
{ "folke/neodev.nvim", opts = {} },
-- optional but recommended for installing servers
"williamboman/mason.nvim",
},
config = function()
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local keymap = vim.keymap

-- Mason (only for installing binaries, not configuring LSP)
require("mason").setup()

-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = "Show LSP references"
    keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definitions"
    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

    opts.desc = "Show LSP implementations"
    keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "Code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Rename symbol"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Prev diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

    opts.desc = "Next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    opts.desc = "Hover docs"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
  end,
})

-- capabilities (for nvim-cmp)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

------------------------------------------------------------------
-- Define your servers here
------------------------------------------------------------------

local servers = {
  -- Lua
  lua_ls = {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },

  -- Example: Python
  pyright = {
    capabilities = capabilities,
  },

  -- Example: C/C++
  clangd = {
    capabilities = capabilities,
  },

  -- Add more servers here
  -- tsserver = { capabilities = capabilities },
}

------------------------------------------------------------------
-- Register + enable servers
------------------------------------------------------------------

for name, config in pairs(servers) do
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

end,
}
