return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', 
    'nvim-tree/nvim-web-devicons', 
  },
  init = function() 
    vim.g.barbar_auto_setup = false 
  end,
  opts = {
    animation = false,
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
    },
    insert_at_start = true,
    clickable = true,
    separator = {left = '', right = '│'},
    separator_at_end = false,
    modified = {button = '●'},
    sidebar_filetypes = {
      NvimTree = true,
      undotree = {
        text = 'undotree',
        align = 'center',
      },
    }
  },
}

