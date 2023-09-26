local builtin = require('telescope.builtin')

require("telescope").setup({
  defaults = {
    dynamic_preview_title = true,
    layout_strategy = "vertical",
    layout_config = {vertical = {width = 0.9, height = 0.9, preview_height = 0.6, preview_cutoff = 0}},
    path_display = {"smart", shorten = {len = 3}},
    wrap_results = true
  }
})

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<c-f>', builtin.live_grep, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
