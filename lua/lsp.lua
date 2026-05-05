vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.cmd.packadd("nvim-lspconfig")

vim.lsp.enable({
  -- shell / infra
  "bashls",
  "dockerls",
  "yamlls",
  "jsonls",
  "helm_ls",

  -- general programming
  "pyright", -- Python
  "ts_ls", -- TypeScript / JavaScript
  "gopls", -- Go
  "rust-analyzer", -- Rust
  "clangd", -- C / C++
  "jdtls", -- Java

  -- scripting / config
  "lua_ls",
  "taplo", -- TOML

  -- web
  "html",
  "cssls",

  -- docs / misc
  "marksman", -- Markdown
  "texlab", -- LaTeX
})
vim.diagnostic.config({ virtual_text = true })
