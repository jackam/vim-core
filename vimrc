" === [ Start vim-plug bootstrap ] ===============================
" if the directory doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  " silently load the plugins
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " The autocmd re-sources vimrc after installing plug.vim,
  " then installs the plugins listed below.
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" === [ End vim-plug bootstrap ] =================================

set nocompatible

call plug#begin('~/.vim/plugged')

" === [ My Plugins ] =============================================
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }

call plug#end()

let mapleader = "\\"
let g:NERDTreeShowHidden = 1

" UI action { " buffer control
nnoremap <S-J> :bprev<CR>
nnoremap <S-K> :bnext<CR>
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <leader>c :nohlsearch<CR>
nnoremap <leader>\ :nohlsearch<CR>

" buffer view {
set t_Co=256
let base16colorspace=256
set termguicolors
set background=dark
set hlsearch
set number
set ruler
set laststatus=2
set cursorline
set ignorecase
syntax enable
set scrolloff=999
set tabstop=4
set shiftwidth=4
set autoindent
filetype plugin indent on

" system {
set clipboard+=unnamed
set paste
set backup
set backupdir=~/backup
set backupext=.bak
set writebackup

" Set color scheme and open NERDTree after plugins have been loaded
" This autocmd runs after the initial `PlugInstall`
autocmd VimEnter * if !empty(glob('~/.vim/plugged/embark')) | colorscheme embark | endif
autocmd VimEnter * NERDTree | wincmd p
