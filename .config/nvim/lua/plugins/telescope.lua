return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, 
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true
        }
      }
    })

    telescope.load_extension("fzf")

    end,
}
