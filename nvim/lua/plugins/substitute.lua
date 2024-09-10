return {
  "gbprod/substitute.nvim",
  config = function()
    local substitute = require('substitute')
    vim.keymap.set('n', 's', substitute.operator, {})
    vim.keymap.set('v', 's', substitute.visual, {})
  end
}
