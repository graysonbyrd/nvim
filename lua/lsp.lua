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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})
