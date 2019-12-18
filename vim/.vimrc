"Vundle
set nocompatible       
filetype off          
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Required Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Added Later
Bundle 'https://github.com/gorodinskiy/vim-coloresque.git'
Plugin 'vim-airline/vim-airline'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'pangloss/vim-javascript' 
Plugin 'mxw/vim-jsx'
Plugin 'http://github.com/tpope/vim-surround'
Plugin 'https://tpope.io/vim/commentary.git'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'machakann/vim-highlightedyank'
Plugin 'jwalton512/vim-blade'
Plugin 'posva/vim-vue'
"Color Schemes
Plugin 'tomasiser/vim-code-dark'
Plugin 'morhetz/gruvbox'
Plugin 'rakr/vim-one'

call vundle#end()
filetype plugin indent on

"Theme Settings
set termguicolors
syntax enable
set background=dark
let g:airline_theme='one'
let g:gruvbox_contrast_dark = 'hard'
colorscheme one

let g:indentLine_setColors = 0
"Relative line numbers
set number
set relativenumber
set nowrap
set autoindent
set smartindent
set tabstop=4 
set shiftwidth=4  
set expandtab

"control-n shortcut for nerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
			
"Prettier format on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
