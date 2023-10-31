vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 2
vim.opt.swapfile = false
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.wo.relativenumber = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Remove found pattern highlighting
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- better scrolling
vim.keymap.set('n', '<C-d>', '10j')
vim.keymap.set('n', '<C-u>', '10k')

-- resize windows
vim.keymap.set('n', '<C-.>', ':vertical resize +10<CR>')
vim.keymap.set('n', '<C-,>', ':vertical resize -10<CR>')
vim.keymap.set('n', '<C-=>', '<C-w>=')

-- exit terminal mode 
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

