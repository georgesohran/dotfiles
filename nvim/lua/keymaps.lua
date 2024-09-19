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

--git integration (luckily found out about fugitive, so now using it )
-- local miniui_width = 80
-- local miniui_heigth = 15
--
-- local mini_window = function (buf)
--   local ui = vim.api.nvim_list_uis()[1]
--   local window = vim.api.nvim_open_win(buf, 1, {
--     relative = 'editor',
--     width = miniui_width,
--     height = miniui_heigth,
--     col = (ui.width/2) - (miniui_width/2),
--     row = (ui.height/2) - (miniui_heigth/2),
--     anchor = 'NW',
--     style = 'minimal',
--     border = 'rounded'
--   })
--   return window
-- end
--
-- -- git add 
-- vim.keymap.set('n', '<leader>ga', function ()
--   local path = vim.fn.expand("%:p:h")
--   local file = vim.fn.expand("%:p")
--
--   os.execute(string.format('cd %s', path))
--   os.execute(string.format('git add %s', file))
--
--   print(string.format('git added file: %s', file))
--
--   os.execute('exit')
-- end, { desc = 'git add current file'})
--
--
-- -- git commit
-- vim.keymap.set('n', '<leader>gc', function ()
--   local path = vim.fn.expand("%:p:h")
--   os.execute(string.format('cd %s', path))
--
--   local prompt = 'your commit message here:  '
--
--   local message = vim.fn.input(prompt)
--
--   local h = io.popen(string.format('git commit -m "%s"', message))
--   local res = h:read('*a')
--   h:close()
--
--   print('commit')
--
--   os.execute('exit')
-- end, { desc = 'git commit'})
--
--
-- -- git push
-- vim.keymap.set('n', '<leader>gP', function ()
--   local path = vim.fn.expand("%:p:h")
--   os.execute(string.format('cd %s', path))
--
--   -- local buf = vim.api.nvim_create_buf(false, true)
--
--   os.execute('git push')
--
--   -- local tempfile = io.open('/tmp/tempgitfile')
--   -- io.output(tempfile)
--
--   -- mini_window(buf)
--
--   -- local lines = {}
--   -- local c = 1
--   -- for line in out:lines() do
--   --   lines[c] = line
--   --   c = c + 1
--   -- end
--
--   -- vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>q<CR>',{})
--   -- vim.api.nvim_buf_set_lines(buf, 0, miniui_heigth, false, lines)
--   
--   os.execute('exit')
-- end, { desc = 'git push'})
--
--
-- -- git status
-- vim.keymap.set('n', '<leader>gs', function ()
--   local path = vim.fn.expand("%:p:h")
--   os.execute(string.format('cd %s', path))
--
--   local buf = vim.api.nvim_create_buf(false, true)
--
--   vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>q<CR>',{})
--   vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<cmd>q<CR>',{})
--   vim.api.nvim_buf_set_keymap(buf, 'n', '<C-q>', '<cmd>q<CR>',{})
--
--   mini_window(buf)
--
--   local out = io.popen('git status')
--
--   local lines = {}
--   local c = 1
--   for line in out:lines() do
--     lines[c] = line
--     c = c + 1
--   end
--
--   out:close()
--
--   vim.api.nvim_buf_set_lines(buf, 0, miniui_heigth, false, lines)
--
-- end, { desc = 'git status' })
--
--
-- vim.keymap.set('n', '<leader>gC', function()
--   local path = vim.fn.expand("%:p:h")
--   os.execute(string.format('cd %s', path))
--
-- end, {desc = 'git checkout'})
--
--
-- vim.keymap.set('n', '<leader>gp', function ()
--   local path = vim.fn.expand('%:p:h')
--   os.execute(string.format('cd %s', path))
--
-- end, { desc = 'git pull'})
