return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls", -- Using ts_ls
          "html",
          "emmet_ls",
          "gopls",
          "jdtls",
          "eslint",
          "clangd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Common on_attach function for all LSP servers
      local on_attach = function(client, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
      end

      -- Use the new vim.lsp.start API for each server
      -- Lua
      vim.lsp.start({
        name = "lua_ls",
        cmd = { "lua-language-server" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          }
        }
      })

      -- TypeScript/JavaScript - USING TS_LS
      vim.lsp.start({
        name = "ts_ls",
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
      })

      -- HTML
      vim.lsp.start({
        name = "html",
        cmd = { "vscode-html-language-server", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html" }
      })

      -- Emmet
      vim.lsp.start({
        name = "emmet_ls",
        cmd = { "emmet-ls", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Go
      vim.lsp.start({
        name = "gopls",
        cmd = { "gopls" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
      })

      -- Java
      vim.lsp.start({
        name = "jdtls",
        cmd = { "jdtls" },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- ESLint
      vim.lsp.start({
        name = "eslint",
        cmd = { "vscode-eslint-language-server", "--stdio" },
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
      })

      -- C/C++
      vim.lsp.start({
        name = "clangd",
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=never",
          "--completion-style=detailed",
        },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Your existing diagnostics toggle
      local isLspDiagnosticsVisible = true
      vim.keymap.set("n", "<leader>lx", function()
        isLspDiagnosticsVisible = not isLspDiagnosticsVisible
        vim.diagnostic.config({
          virtual_text = isLspDiagnosticsVisible,
          underline = isLspDiagnosticsVisible,
        })
      end)
    end,
  },
}
