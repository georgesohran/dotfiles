return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
    },
    config = function()
      local treesitter = require('nvim-treesitter.configs')
      treesitter.setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          'lua',
          'json',
          'javascript',
          'typescript',
          'tsx',
          'html',
          'css',
          'python',
          'rust',
          'dockerfile',
          'bash',
        },
      })
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false
        },
      })
    end
  },
}
