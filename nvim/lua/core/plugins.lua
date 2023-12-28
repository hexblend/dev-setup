local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Install plugins here
  use 'wbthomason/packer.nvim'
  -- theme and icons
  use 'folke/tokyonight.nvim'
  use 'nvim-tree/nvim-web-devicons'
  -- filetree
  use 'nvim-tree/nvim-tree.lua'
  -- status line
  use 'nvim-lualine/lualine.nvim'
  -- language support
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- lsp
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  }
  -- prettier
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  -- completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'olexsmir/gopher.nvim'
  use 'github/copilot.vim'
  -- auto surrounds 
  use {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup() end
  }
  use {
    'windwp/nvim-ts-autotag',
    branch = 'main',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function () require('nvim-ts-autotag').setup() end
  }
  use {
    "kylechui/nvim-surround",
    tag = "*",
    config = function() require("nvim-surround").setup({}) end
  }
  -- fzf
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }
  -- float terminal
  use 'akinsho/toggleterm.nvim'
  -- git
  use 'lewis6991/gitsigns.nvim'
  -- keep cursor centered
  use {
    "arnamak/stay-centered.nvim",
    config = function() require("stay-centered").setup {} end
  }
  -- horizontal travel
  use 'jinh0/eyeliner.nvim'
  -- comments
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- Barline
  use 'lewis6991/gitsigns.nvim'
  use 'romgrk/barbar.nvim'




  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
