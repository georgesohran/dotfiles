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
local miniui_width = 80
local miniui_heigth = 15

local mini_window = function (buf)
  local ui = vim.api.nvim_list_uis()[1]
  local window = vim.api.nvim_open_win(buf, 1, {
    relative = 'editor',
    width = miniui_width,
    height = miniui_heigth,
    col = (ui.width/2) - (miniui_width/2),
    row = (ui.height/2) - (miniui_heigth/2),
    anchor = 'NW',
    style = 'minimal',
    border = 'rounded'
  })
  return window
end

local commit_window = function (buf)
  local ui = vim.api.nvim_list_uis()[1]
  local window = vim.api.nvim_open_win(buf, 1, {
    relative = 'editor',
    width = miniui_width,
    height = 5,
    col = (ui.width/2) - (miniui_width/2),
    row = (ui.height/2) - (5/2),
    anchor = 'NW',
    style = 'minimal',
    border = 'rounded'
  })
  vim.api.nvim_win_set_option(window, 'wrap', true)
  return window
end


-- git add 
vim.keymap.set('n', '<leader>ga', function ()
  local path = vim.fn.expand("%:p:h")
  local file = vim.fn.expand("%:p")

  os.execute(string.format('cd %s', path))
  os.execute(string.format('git add %s', file))

  print(string.format('git added file: %s', file))
end, { desc = 'git add current file'})


-- git commit
vim.keymap.set('n', '<leader>gc', function ()
  local path = vim.fn.expand("%:p:h")
  os.execute(string.format('cd %s', path))

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, 0, false, {'your commit message here: '})

  local win = commit_window(buf)
  vim.api.nvim_win_set_cursor(win, {1, string.len('your commit message here:')})

  local commit_msg = ''
  vim.api.nvim_buf_create_user_command(buf, 'CloseWindow', function()
    commit_msg = vim.api.nvim_buf_get_lines(buf, 1, 100, false)[2]
    vim.api.nvim_buf_delete(buf, {})
    print(commit_msg)
  end, {})
  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', '<cmd>CloseWindow<CR>', {})

end, { desc = 'git commit'})


-- git push
vim.keymap.set('n', '<leader>gP', function ()
  local path = vim.fn.expand("%:p:h")
  os.execute(string.format('cd %s', path))

  local buf = vim.api.nvim_create_buf(false, true)

  mini_window(buf)

  local out = io.popen('git push')

  local lines = {}
  local c = 1
  for line in out:lines() do
    lines[c] = line
    c = c + 1
  end

  out:close()

  vim.api.nvim_buf_set_lines(buf, 0, miniui_heigth, false, lines)

end, { desc = 'git push'})


-- git status
vim.keymap.set('n', '<leader>gs', function ()
  local path = vim.fn.expand("%:p:h")
  os.execute(string.format('cd %s', path))

  local buf = vim.api.nvim_create_buf(false, true)

  mini_window(buf)

  local out = io.popen('git status')

  local lines = {}
  local c = 1
  for line in out:lines() do
    lines[c] = line
    c = c + 1
  end

  out:close()

  vim.api.nvim_buf_set_lines(buf, 0, miniui_heigth, false, lines)

end, { desc = 'git status' })


vim.keymap.set('n', '<leader>gC', function()
  local path = vim.fn.expand("%:p:h")
  os.execute(string.format('cd %s', path))

end, {desc = 'git checkout'})


vim.keymap.set('n', '<leader>gp', function ()
  local path = vim.fn.expand('%:p:h')
  os.execute(string.format('cd %s', path))

  os.execute(string.format('git pull'))
end, { desc = 'git pull'})
