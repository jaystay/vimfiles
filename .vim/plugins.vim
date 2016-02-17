filetype off                  " required!

" vundle initialization
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'wincent/Command-T'
Plugin 'vim-scripts/ShowMarks'
Plugin 'Rip-Rip/clang_complete'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'edsono/vim-matchit'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'
Plugin 'groenewege/vim-less'
Plugin 'darthmall/vim-vue'
Plugin 'tpope/vim-vinegar'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'

" experimental
Plugin 'sjl/gundo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

call vundle#end()               " required
filetype plugin indent on       " required
