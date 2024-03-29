" Step 0. Install Vundle
"
"   $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Source: https://github.com/VundleVim/Vundle.vim


" Mandatory Vundle configuration, cf https://github.com/VundleVim/Vundle.vim#quick-start
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'tpope/vim-markdown'
Plugin 'hashivim/vim-terraform'
Plugin 'rodjek/vim-puppet'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
runtime myrc
