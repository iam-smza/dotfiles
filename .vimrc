
" VIMRunCommands file
" Maintainer: Zamran Ali
" Github: https://www.github.com/iam-smza
" Twitter: @iam_smza

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""" REQUISITES """""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" to use enhanced VIM features (this is turned on by default, but meh!)
set nocompatible

" using utf-8 format when working with vim
set encoding=utf-8

" to disable .swap files
set noswapfile

" get clipboard (look_it_up_later: learn more about vim keyboard when you have time)
set clipboard=unnamed

" set term colors to show 256
set t_Co=256

" show when leader key is pressed
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""" PLUG-INS """"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" syntax checker for python using PEP8 standards
Plugin 'nvie/vim-flake8'
" file tree for vim. Use 'Ctrl+N' to show and hide
Plugin 'scrooloose/nerdtree'
" fuzzy finder that can find almost anything, except love.
Plugin 'kien/ctrlp.vim'
" matching braces babe !
Plugin 'jiangmiao/auto-pairs'
" python code formatter (look_it_up_later: this is not working because of 'pylama')
" Plugin 'dense-analysis/ale'
" VIM strip
Plugin 'vim-airline/vim-airline'
" theme for airline
Plugin 'kyoz/purify', { 'rtp': 'vim' }
" collection of colorschemes to customize vim
Plugin 'flazz/vim-colorschemes'
" real time autocompleter for python, typescript, javascript, lisp and whatnot !
Plugin 'maralla/completor.vim'
" Dark theme for vim. Love it !
Plugin 'liuchengxu/space-vim-dark'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""" VISUALS """""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show a visual line under the cursor's current line
set cursorline

" enable syntax and custom colorscheme
" more colorschemes you like are hybrid, cryslominsa and afterglow
colorscheme space-vim-dark

" enable all Python syntax higlighting features
let python_highlight_all = 1

" turn hybrid line numbers on
set number relativenumber

" indent when moving to the next line while writing code
set autoindent

" set tabs to have 4 spaces
set ts=4

" set tab to work as spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show the matching part of the pair for [] {} and ()
set showmatch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""" MAPPINGS """"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map two-semicolon (;;) to mimic Escape in INSERT MODE
imap ;; <Esc>

" non-recursive mapping of 'U' to mimic redo in NORMAL MODE
nnoremap U <C-R>

" Map 'ctrl+r' to save while in INSERT MODE and NORMAL MODE
nmap <c-r> :w<CR>
imap <c-r> <Esc>:w<CR>

" run the code using Python3.x when pressing 'F9' in NORMAL MODE
nnoremap <buffer> <F9> :exec '!python3.7' shellescape(@%, 1)<cr>
" look_it_up_later: how to use 'clear' function in the above bind when running python code
" imap <F9> <Esc>:w<CR>:!clear;python %<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""" ADDITIONAL DATA FOR PLUG-INS """"""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TO USE BELOW STUFF YOU NEED TO HAVE VARIOUS PYTHON PACKAGES INSTALLED NAMELY
" 1. python3.x - Python Package and IDLE for programming
" 2. PIP - Python Installer Package (Install package for python3.x if you want it to work)
" 3. flake8 - Syntax checker for Python (python3.x -m pip install flake8)
" 4. yapf - Auto python formatter (python3.x -m pip install yapf)
" 5. Something else I am forgetting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""" for nerd-tree plugin """"""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map Ctrl+N to toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

" close vim if only open window available is nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" change default arrows in nerd tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""" for air-line strip """""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme='purify'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""" for dense-analysis/ale """""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""" for google/yapf """"""""""""""""""""""""""""""""""""'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" format the python code to pep8 standards using '\='
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""" SPLIT NAVIGATION """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow
set splitright

"split navigations

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""" BUH-BYE """"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
