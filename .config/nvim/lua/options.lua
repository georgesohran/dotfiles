vim.o.backspace = '2'
vim.o.showcmd = true
vim.o.autowrite = true
vim.o.cursorline = true

vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'

vim.o.tabstop = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.expandtab = true

vim.o.scrolloff = 10

vim.o.relativenumber = true
vim.o.number = true
vim.wo.fillchars='eob: '

vim.o.wrap = false
vim.o.background = 'dark'
vim.o.backspace = 'indent,eol,start'

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.laststatus = 3

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

vim.diagnostic.config({
  virtual_text = false
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})


