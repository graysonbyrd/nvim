vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

local conform = require("conform")

conform.setup({
  formatters = {
    black = {
      args = { "--target-version", "py310", "--quiet", "-" },
    },
  },
  formatters_by_ft = {
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },
  format_on_save = {
    lsp_format = "fallback",
    async = false,
    timeout_ms = 5000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_format = "fallback",
    async = false,
    timeout_ms = 5000,
  })
end, { desc = "Format file or range (in visual mode)" })
