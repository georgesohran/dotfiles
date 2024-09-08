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
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      --vim.cmd('colorscheme kanagawa')
    end
  },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      --vim.cmd('colorscheme everforest')
    end,
  }
}
