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
          'html',
          'pyright',
          'ast_grep',
          'lua_ls',
          'rust_analyzer',
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lsp_conf = require('lspconfig')
      lsp_conf.lua_ls.setup({capabilities = capabilities})
      lsp_conf.ast_grep.setup({capabilities = capabilities})
      lsp_conf.rust_analyzer.setup({capabilities = capabilities})
      lsp_conf.pyright.setup({capabilities = capabilities})
      lsp_conf.html.setup({capabilities = capabilities})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

    end
  }
}

