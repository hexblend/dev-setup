require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    'typescript',
    'tsx',
    'javascript',
    'jsdoc',
    'json',
    'html',
    'css',
    'scss',
    'lua',
    'yaml',
    'python',
    'cpp',
    'php',
    'phpdoc',
    'regex',
    'vim',
    'markdown',
    'comment'
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
    enable_close_on_slash = false,
  },
  indent = {
    enable = true,
  }
}
