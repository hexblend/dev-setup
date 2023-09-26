require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
