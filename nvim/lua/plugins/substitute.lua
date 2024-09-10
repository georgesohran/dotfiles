return {
  "gbprod/substitute.nvim",
  config = function()
    local substitute = require('substitute')
    vim.keymap.set('n', 's', substitute.operator, { noremap = true })
    vim.keymap.set('v', 's', substitute.visual, {noremap = true })
  end
}
