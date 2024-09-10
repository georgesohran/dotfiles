return {
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd('colorscheme gruvbox-material')
    end
  },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd('colorscheme everforest')
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      require('catppuccin').setup({
        flavour = 'mocha',
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          alpha = true,
          barbar = true,
        }
      })

      -- vim.cmd('colorscheme catppuccin')
    end
  }
}
