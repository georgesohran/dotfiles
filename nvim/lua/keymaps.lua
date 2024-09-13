vim.g.mapleader = ' '

vim.keymap.set('i', 'jk', '<Esc>', {})

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

--toggleterm
vim.keymap.set({'n', 't'}, '<C-t>', '<cmd>ToggleTerm size=15 direction=horizontal name=terminal<CR>', {})


--git integration (maybe turn it into a plugin, didn't like lazy git)

vim.keymap.set('n', '<leader>ga', function ()
  local path = vim.fn.expand("%:p:h")
  local file = vim.fn.expand("%:p")
  os.execute(string.format('cd %s', path))
  os.execute(string.format('git add %s', file))

  print(string.format('added file: %s', file))
end, { desc = 'git add current file'})


vim.keymap.set('n', '<leader>gc', function ()
  local path = vim.fn.expand("%:p:h")
  os.execute(string.format('cd %s', path))

  local commit_msg = vim.fn.input('commit message: ')

  -- execute comand without somehow flooding current buffer 
  io.popen(string.format('git commit -m "%s"', commit_msg)):close()

  print('commited')
end, { desc = 'git commit'})


vim.keymap.set('n', '<leader>gp', function ()
  local path = vim.fn.expand("%:p:h")
  os.execute(string.format('cd %s', path))

  -- execute comand without somehow flooding current buffer 
  local out = io.popen('git push')
  out:close()

  print('pushed branch main')
end, { desc = 'git push'})


vim.keymap.set('n', '<leader>gs', function ()
  local path = vim.fn.expand("%:p:h")
  os.execute(string.format('cd %s', path))

  local out = io.popen('git status')
  local text = out:read('*a')
  out:close()
  
  require('utils').get_floating_window(60,15)
  
end, { desc = 'git status' })


vim.keymap.set('n', '<leader>gC', function()
  local path = vim.fn.expand("%:p:h")
  os.execute(string.format('cd %s', path))

end, {desc = 'git checkout'})

vim.keymap.set('n', '<leader>gP', function ()
  local path = vim.fn.expand('%:p:h')
  os.execute(string.format('cd %s', path))

  os.execute(string.format('git pull'))
end, { desc = 'git pull'})
