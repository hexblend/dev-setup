"Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

"Editor config
set encoding=UTF-8
set number
set relativenumber
set nowrap
set tabstop=2 
set shiftwidth=2
set expandtab
set autoindent

"Utility Plugins
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
"File Browsing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ggreer/the_silver_searcher'
Plug 'BurntSushi/ripgrep'
"TypeScript Support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi' 

"Color Schemes
Plug 'joshdick/onedark.vim' "onedark

call plug#end()

"Theme Settings
if (has("termguicolors"))
 set termguicolors
endif
syntax on
colorscheme onedark
set background=dark
let g:onedark_termcolors=256
let g:indentLine_enabled = 1
set t_Co=256

"Airline
let g:airline_theme='onedark'
let g:airline_extensions = []
let g:airline_powerline_fonts = 1
set statusline+=%F

"Nerdtree
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-e> :NERDTreeFind<CR>
let NERDTreeWinSize = 60
" Start when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"File Navigation
"FZF
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Ag<CR>
nnoremap <C-t> :Buffers<CR>

"TS Support
"set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd FileType typescript setlocal completeopt+=menu,preview
set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_definition_split = 2 
noremap gd :TsuDefinition<CR>
noremap gb :TsuquyomiGoBack<CR>
noremap ds :TsuReferences<CR>
noremap ii :TsuImport<CR>
noremap rr :TsuRenameSymbolC<CR>






			
