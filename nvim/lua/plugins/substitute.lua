return {
  "gbprod/substitute.nvim",
  config = function()
    vim.keymap.set('n', 's', require('substitute').operator, {})
    vim.keymap.set('x', 's', require('substitute').visual, {})
  end
}
