return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({})
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'ts_ls',
          'html',
          'tailwindcss',
          'pyright',
          'lua_ls',
          'cssls',
          'gopls',
          'clangd',
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.lsp.config.ts_ls = {
        capabilities = capabilities,
        filetypes = {
          'javascriptreact',
          'javascript',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.jsx',
          'css'
        }
      }
      vim.lsp.enable('ts_ls')

      vim.lsp.config.html = {capabilities=capabilities}
      vim.lsp.enable('html')

      vim.lsp.config.tailwindcss = {capabilities = capabilities}
      vim.lsp.enable('tailwindcss')

      vim.lsp.config.pyright = {capabilities = capabilities}
      vim.lsp.enable('pyright')

      vim.lsp.config.lua_ls = {capabilities = capabilities}
      vim.lsp.enable('lua_ls')

      vim.lsp.config.cssls = {capabilities = capabilities}
      vim.lsp.enable('cssls')

      vim.lsp.config.clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_markers = {
          'compile_commands.json',
          'compile_flags.txt',
          '.git',
        },
        capabilities = capabilities,
      }
      vim.lsp.enable('clangd')

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

    end
  }
}

