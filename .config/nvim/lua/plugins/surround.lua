return {
  "kylechui/nvim-surround",
  version = "^4.0.0",
  event = "VeryLazy",
  config = {
    vim.keymap.set("x", "s", "<Plug>(nvim-surround-visual)")
  }
}
