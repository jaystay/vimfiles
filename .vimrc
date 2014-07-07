set nocompatible
set noswapfile
set nobackup

filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/Emmet.vim'
Bundle 'wincent/Command-T'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/ShowMarks'
Bundle 'Rip-Rip/clang_complete'

" Leader
let mapleader = ","

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
set showcmd

set number
nnoremap <leader>n :set nonumber!<CR>

syntax on

" Whitespace stuff
set wrap
set linebreak
nnoremap <leader>w :set wrap!<CR>
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set listchars=tab:▸\ ,eol:¶,trail:·,extends:¬
set smartindent
set autoindent
set cindent
filetype on
filetype indent on
filetype plugin on
nmap <leader>l :set list!<CR>

" auto format
"autocmd BufRead,BufWritePre *.php normal gg=G 

set encoding=utf-8

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" clear highlighting
nmap <leader>/ :noh<return>

" Filename Tab completion 
set wildmode=list:longest,list:full
set wildmenu

" File navigation
map <Leader>r :NERDTreeToggle<CR>  
let NERDTreeShowHidden=1

" scrolling
:nnoremap <Leader>zz :let &scrolloff=12-&scrolloff<CR>
:nnoremap <Leader>zx :let &scrolloff=99999-&scrolloff<CR>

" list and choose buffers easily 
nmap <leader>b :ls<CR>:buffer<Space>

" shift-up edits .vimrc and shift-down sources the file and sends you back to
" the previous buffer
noremap <S-up> :e ~/.vimrc<CR>
noremap <S-down> :source ~/.vimrc<CR>

" select all
map <Leader>a ggVG

" folding
map <Leader>fi :set foldmethod=indent<CR>
map <Leader>fs :set foldmethod=syntax<CR>

function! TabLeft()
  let tab_number = tabpagenr() - 1
  if tab_number == 0
    execute "tabm" tabpagenr('$') - 1
  else
    execute "tabm" tab_number - 1
  endif
endfunction
function! TabRight()
  let tab_number = tabpagenr() - 1
  let last_tab_number = tabpagenr('$') - 1
  if tab_number == last_tab_number
    execute "tabm" 0
  else
    execute "tabm" tab_number + 1
  endif
endfunction

" tab navigation
"command-shift-] next tab
map <D-S-]> gt  
"command-shift=[ previous tab
map <D-S-[> gT  
"command-] move tab right
map <D-]> :execute TabRight()<CR>
"command-] move tab left
map <D-[> :execute TabLeft()<CR>

" remove toolbar on macvim gui
if has("gui_running")
  set guioptions-=T

  function! SwitchScheme()
    if s:currscheme == 0
      colorscheme ron 
      let s:currscheme = 1
    elseif s:currscheme == 1
      colorscheme morning 
      let s:currscheme = 2
    elseif s:currscheme == 2
      colorscheme murphy 
      let s:currscheme = 3
    elseif s:currscheme == 3
      colorscheme peachpuff 
      let s:currscheme = 4
    elseif s:currscheme == 4
      colorscheme torte 
      let s:currscheme = 5
    elseif s:currscheme == 5
      colorscheme darkblue 
      let s:currscheme = 6
    elseif s:currscheme == 6
      colorscheme zellner 
      let s:currscheme = 0
    endif
  endfunction

  let s:currscheme = 0
  colorscheme zellner 
  nmap <leader>sc :call SwitchScheme()<CR>

endif


" remap : to space
nnoremap <space> :

" Use double-<space> to save the file
nnoremap <space><space> :w<cr>

" Use double-leader to jump to last file
nnoremap <leader><leader> <c-^>

" exuberant ctags
" set tags=~/.vim/mytags/php-webapi
" map <leader>tg :!php-webapi-tags.sh<CR> 

" TODO
"set tags=tags
"map <leader>tg :!./tags.sh<CR> 
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <Leader>\ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" TODO
"let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
"map <leader>fl :TlistToggle<CR>

" remap tab completion to control space
inoremap <c-space> <c-n>
map <leader>e :CommandT<CR>
map <leader>ctf :CommandTFlush<CR>

" splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"eclim
map <leader>oi :JavaImportOrganize<CR>
map <leader>ren :JavaRename

nmap <leader>v :vertical resize +6<CR>
nmap <leader>vl :vertical resize -6<CR>

" showmarks
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" file types
au BufRead,BufNewFile *.twig set filetype=html

" ask for passwords for system files
cmap w!! %!sudo tee > /dev/null %


" clang_complete stuff
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
let g:clang_snippets = 1

" SYNTASTIC stuff

" Show sidebar signs.
let g:syntastic_enable_signs=1
" Tell it to use clang instead of gcc
let g:syntastic_objc_compiler = 'clang'
let g:syntastic_objc_check_header = 1

" Read the clang complete file
let g:syntastic_objc_config_file = '.clang_complete'

" Tell it to use clang instead of gcc
let g:syntastic_objc_checker = 'clang'
