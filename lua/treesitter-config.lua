vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    post = function()
      vim.cmd("TSUpdate")
    end,
  },
  { src = "https://github.com/windwp/nvim-ts-autotag", name = "nvim-ts-autotag" },
  { src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring", name = "nvim-ts-context-commentstring" },
})

-- Install parsers (only missing ones)
local installed = require("nvim-treesitter.config").get_installed()
local wanted = {
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
}
local to_install = vim.tbl_filter(function(p)
  return not vim.tbl_contains(installed, p)
end, wanted)
if #to_install > 0 then
  require("nvim-treesitter").install(to_install)
end

-- Enable highlighting + indentation for all filetypes
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Autotag and commentstring (standalone setup)
require("nvim-ts-autotag").setup()
require("ts_context_commentstring").setup({ enable_autocmd = false })
