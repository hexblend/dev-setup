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
"Utility Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'pangloss/vim-javascript' 
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
Plugin 'http://github.com/tpope/vim-surround'
Plugin 'https://tpope.io/vim/commentary.git'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'machakann/vim-highlightedyank'
Plugin 'jwalton512/vim-blade'
Plugin 'posva/vim-vue'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'ternjs/tern_for_vim', {'do' : 'npm install'}
"Color Schemes
Plugin 'tomasiser/vim-code-dark' "codedark
Plugin 'morhetz/gruvbox' "gruvbox
Plugin 'joshdick/onedark.vim' "onedark
Plugin 'ChrisKempson/Tomorrow-Theme' "Tomorrow Night
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on

"Theme Settings
if (has("termguicolors"))
 set termguicolors
endif
syntax on
set background=dark
let g:airline_theme='onedark'
let g:gruvbox_contrast_dark = 'medium'
set t_Co=256
let g:onedark_termcolors=256
colorscheme base16-oceanicnext


"Editor config
set number
set relativenumber
set nowrap
set tabstop=4 
set shiftwidth=4
set expandtab
set autoindent
let g:indentLine_enabled = 1


"control-n shortcut for nerdTree
map <C-n> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
			
"Prettier format on save
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#tab_width = 4

",, shortcut for emmet
let g:user_emmet_leader_key=','
