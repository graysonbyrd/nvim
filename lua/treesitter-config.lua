vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    post = function()
      vim.cmd("TSUpdate")
    end,
  },
  {
    src = "https://github.com/windwp/nvim-ts-autotag",
    name = "nvim-ts-autotag",
  },
  {
    src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
    name = "nvim-ts-context-commentstring",
  },
})

require("nvim-treesitter.config").setup({
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "bash",
    "lua",
    "vim",
    "vimdoc",
    "dockerfile",
    "gitignore",
    "query",
    "c",
    "cpp",
    "python",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
})
