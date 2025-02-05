return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        signcolumn = 'yes'
      },
      renderer = {
        group_empty = true,
        icons = {
          git_placement = 'right_align',
          symlink_arrow = "  ",
          glyphs = {
            git = {
              untracked = " ",
              unstaged = " "
            }
          },
          show = {
            git = true,
          },
        },
      },
      filters = {
        git_ignored = false
      }
   })
  end
}
