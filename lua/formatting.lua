-- Install plugin
vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

-- Setup
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    -- python = { "isort" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})

-- Keymap
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })
