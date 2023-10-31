require('tokyonight').setup({
  style = "storm",
  transparent_background = true,
  transparent = true,
  styles = {
    sidebar = "transparent",
    floats = "transparent"
  }
})

vim.opt.termguicolors = true
vim.cmd[[colorscheme tokyonight]]

