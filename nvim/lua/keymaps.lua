vim.g.mapleader = ' '

vim.keymap.set('i', 'jk', '<Esc>', {})

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
vim.keymap.set('n', '<leader>tl', '<cmd>BufferNext<CR>', {})
vim.keymap.set('n', '<leader><Tab>', '<cmd>BufferNext<CR>', {})
vim.keymap.set('n', '<leader>th', '<cmd>BufferPrevious<CR>', {})
vim.keymap.set('n', '<leader>tq', '<cmd>BufferClose<CR>', {})

--diagnostics
vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, {})

