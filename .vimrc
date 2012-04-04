set nocompatible

" Leader
let mapleader = ","

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
set showcmd

nmap <leader>c :call Cursors()<CR>

function! Cursors()
  set cursorline!
  set cursorcolumn!
endfunction

set number
syntax on

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set listchars=tab:▸\ ,eol:¶,trail:·,extends:¬
set smartindent
set autoindent
filetype indent on
nmap <leader>l :set list!<CR>
			
set encoding=utf-8

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Writing
set clipboard+=unnamed    " yank to system clipboard

" Filename Tab completion 
set wildmode=list:longest,list:full
set wildmenu

" File navigation
" trying to decide between NERDTree and FuzzyFinder
nmap <leader>ff :FufFile **/<CR>
nmap <leader>fb :FufBuffer<CR>
map <Leader>r :NERDTreeToggle<CR>  

" auto source 
" au BufWritePost .vimrc so ~/.vimrc

" list and choose buffers easily 
nmap <leader>b :ls<CR>:buffer<Space>

noremap <S-up> :e ~/.vimrc<CR>
noremap <S-down> :source ~/.vimrc<CR> :b#<CR>

" select all
map <Leader>a ggVG

" folding
" map <Leader>ft zfat  " fold tag " this doesn't work with foldmethod=syntax TODO - figure out how to get these two to work together
set foldmethod=syntax
set foldnestmax=5
autocmd BufEnter * exe "normal zR"


" tab navigation
map <D-S-]> gt
map <D-S-[> gT

" remove toolbar on macvim gui
if has("gui_running")
  set guioptions-=T
  " set autochdir "this is annoying
endif


" remap : to space
nnoremap <space> :

" Use double-<space> to save the file
nnoremap <space><space> :w<cr>

" Use double-leader to jump to last file
nnoremap <leader><leader> <c-^>

