""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""" REQUISITES """"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set term colors to show 256
set t_Co=256

" to disable .swap files
set noswapfile

" to use enhanced VIM features (this is turned by defalut, but meh!)
set nocompatible

" using utf-8 format when working with vim
set encoding=utf-8

" get clipboard
set clipboard=unnamed

" show when leader key is pressed
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""" PLUGIN """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kyoz/purify', { 'rtp': 'vim' }
Plugin 'flazz/vim-colorschemes'
Plugin 'hdima/python-syntax'
Plugin 'maralla/completor.vim'
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plugin 'liuchengxu/space-vim-dark'
Plugin 'nathanaelkane/vim-indent-guides'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for dense-analysis/ale 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let b:ale_linters = ['flake8']
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'isort',
\   'ale#fixers#generic_python#BreakUpLongLines',
\   'yapf',
\]

nnoremap <buffer> <silent> <LocalLeader>? :ALEFix<CR>
let g:ale_fix_on_save = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for airline plugin & Indent Guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='purify'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for nerdtree plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map Ctrl+N to toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

" close vim if only open window available is nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" change default arrows in nerd tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" VISUALS """""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax and custom colorscheme
colorscheme space-vim-dark

" set background=dark
" colorscheme hybrid
" colorscheme cryslominsa
" colorscheme afterglow

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" set tab to spaces
set expandtab

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent


" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax higlighting features
let python_highlight_all = 1

hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" MAPPING """""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ReMap ;; to Escape the Insert Mode
imap ;; <Esc>
"Redo the changes
nnoremap UU <C-R>

" format code to pep8 using \=. (do a 'pip install yapf' before using)
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

" Use Python3 in VIM
" imap <F9> <Esc>:w<CR>:!clear;python %<CR>
nnoremap <buffer> <F9> :exec '!python3.7' shellescape(@%, 1)<cr>

" Remap Ctrl-R to save while in INSERT MODE and COMMAND MODE
nmap <c-r> :w<CR>
imap <c-r> <Esc>:w<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" SPLITNAVIGATIONS """""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow
set splitright

"split navigations

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
