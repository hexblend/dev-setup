vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    width = 50,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

vim.keymap.set('n', '<c-b>', ':NvimTreeFindFileToggle<CR>')
vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
