-- Mason and LSP
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
})
require("mason").setup({})

-- Todo
vim.pack.add({
  { src = "https://github.com/folke/todo-comments.nvim" },
})
local todo_comments = require("todo-comments")
todo_comments.setup({})
local keymap = vim.keymap
keymap.set("n", "]t", function()
  todo_comments.jump_next()
end, { desc = "Next todo comment" })
keymap.set("n", "[t", function()
  todo_comments.jump_prev()
end, { desc = "Previous todo comment" })

-- Surround
vim.pack.add({
  { src = "https://github.com/kylechui/nvim-surround" },
})
require("nvim-surround").setup({})

-- Git fugitive
vim.pack.add({
  { src = "https://github.com/tpope/vim-fugitive" },
})

-- Tmux nav
vim.pack.add({
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
})

-- Gitsigns
vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup({ signcolumn = false })

-- Colorschemes
vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
})

-- blink (for autocomplete)
vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
  fuzzy = { implementation = "prefer_rust_with_warning" },
  signature = { enabled = true },
  keymap = {
    preset = "default",
    ["<C-space>"] = {},
    ["<C-p>"] = {},
    ["<Tab>"] = {},
    ["<S-Tab>"] = {},
    ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-n>"] = { "select_and_accept" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-b>"] = { "scroll_documentation_down", "fallback" },
    ["<C-f>"] = { "scroll_documentation_up", "fallback" },
    ["<C-l>"] = { "snippet_forward", "fallback" },
    ["<C-h>"] = { "snippet_backward", "fallback" },
    -- ["<C-e>"] = { "hide" },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "normal",
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },

  cmdline = {
    keymap = {
      preset = "inherit",
      ["<CR>"] = { "accept_and_enter", "fallback" },
    },
  },

  sources = { default = { "lsp" } },
})
