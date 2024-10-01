vim.g.mapleader = ' '

vim.keymap.set('i', 'jk', '<Esc>', {})

vim.keymap.set('n', '<leader>nh', '<cmd>nohl<CR>', {})

vim.keymap.set('t', '<C-c>', '<C-\\><C-n>')

-- moving arround
vim.keymap.set('i', '<C-j>', '<Down>', {})
vim.keymap.set('i', '<C-k>', '<Up>', {})
vim.keymap.set('i', '<C-h>', '<Left>', {})
vim.keymap.set('i', '<C-l>', '<Right>', {})

--splitting
vim.keymap.set('n', '<leader>sv', '<C-w>v', {})
vim.keymap.set('n', '<leader>sh', '<C-w>s', {})

--nvim tree
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', {})
vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeFocus<CR>', {})
vim.keymap.set('n', '<leader>el', '<cmd>NvimTreeResize +5<CR>', {})
vim.keymap.set('n', '<leader>es', '<cmd>NvimTreeResize -5<CR>', {})

--telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })

--barbar plugin
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferNext<CR>', {})
vim.keymap.set('n', '<leader>bq', '<cmd>BufferClose<CR>', {})
vim.keymap.set('n', '<leader>bn', '<cmd>BufferNext<CR>', {})
vim.keymap.set('n', '<leader>bp', '<cmd>BufferPrevious<CR>', {})

--diagnostics
vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, {})
vim.keymap.set('n', '<leader>dk', vim.lsp.buf.hover, {})

--toggleterm
vim.keymap.set({'n', 't'}, '<C-t>', '<cmd>ToggleTerm size=15 direction=horizontal name=terminal<CR>', {})

--rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

--fugitive
vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>', {})

vim.keymap.set('n', '<leader>ga', function ()
  local path = vim.fn.expand('%:p')
  vim.cmd(string.format('Git add %s', path))
  print(string.format('added file %s', path))
end, {})

vim.keymap.set('n', '<leader>gc', function ()
  local msg = vim.fn.input('commit message here: ')
  vim.cmd(string.format('Git commit -m "%s"', msg))
end, {})

vim.keymap.set('n', '<leader>gP', '<cmd>Git push<CR>', {})

vim.keymap.set('n', '<leader>gp', '<cmd>Git pull<CR>', {})

vim.keymap.set('n', '<leader>gb', function ()
  local name = vim.fn.input('branch name here: ')
  vim.cmd(string.format('Git branch %s', name))
end, {})

vim.keymap.set('n' ,'<leader>gs', function ()
  local name = vim.fn.input('switch to branch: ')
  vim.cmd(string.format('Git checkout %s', name))
end, {})

vim.keymap.set('n', '<leader>gS', '<cmd>Git status<CR>', {})

