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
          'rust_analyzer',
          -- 'emmet_ls'
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.set_log_level("debug")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local configs = require('lspconfig/configs')

      local lsp_conf = require('lspconfig')
      lsp_conf.ts_ls.setup({
        capabilities = capabilities,
        filetypes = {
          'javascriptreact',
          'javascript',
          'javascript.jsx'
        }
      })
      lsp_conf.html.setup({capabilities=capabilities})
      lsp_conf.tailwindcss.setup({capabilities = capabilities})
      lsp_conf.pyright.setup({capabilities = capabilities})
      lsp_conf.lua_ls.setup({capabilities = capabilities})
      lsp_conf.rust_analyzer.setup({capabilities = capabilities})
      -- lsp_conf.emmet_ls.setup({
      --   capabilities = capabilities,
      --   filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "typescriptreact", "vue" },
      --   init_options = {
      --     html = {
      --       options = {
      --         ["bem.enabled"] = true,
      --       },
      --     },
      --   }}
      -- )

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

    end
  }
}

