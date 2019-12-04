# dotfiles
contains dotfiles from vim and shell


Remove previous versions of VIM like "vim-tiny"
Add VIM PPA: "sudo add-apt-repository ppa:jonathonf/vim"
Download the latest VIM version using "sudo apt install vim"

Install GIT using "sudo apt install git"

CLONE THE VUNDLE REPOSITORY
HERE -> git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

CREATE ~/.vimrc AND PASTE THE STUFF OF THE VIMRC FILE
LAUNCH VIM AND DO :PluginInstall IN COMMAND MODE
YOU CAN'T DO :PluginInstall UNLESS YOU CLONE THE VUNDLE REPOSITORY

EXTRAS:
    THIS CONFIGURATION OF VIM IS DONE SO AS TO RUN PYTHON 3.8
    YOU NEED TO HAVE PYTHON 3.8 INSTALLED ALONG WITH PIP FOR PYTHON 3.8
    Use "python3.8 -m pip install"
    Use "python -m ensurepip" to bind PIP with current version of Python
    DOWNLOAD TO PIP PACKAGES NAMELY: flake8, isort, yapf FOR THIS TO RUN PROPERLY
