set nocompatible                " use latest vim settings, not vi
set noswapfile
set nobackup

so ~/.vim/plugins.vim

" Leader
let mapleader = ","

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
set showcmd

syntax on

" Whitespace stuff
set wrap
"set linebreak
" nnoremap <leader>w :set wrap!<CR>
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set listchars=tab:▸\ ,eol:¶,trail:·,extends:¬
set smartindent
set autoindent
set cindent
nmap <leader>l :set list!<CR>

augroup SmallTabCmds
    autocmd!
    autocmd Filetype sass setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

set encoding=utf-8


" Filename Tab completion 
set wildmode=list:longest,list:full
set wildmenu

" scrolling
:nnoremap <Leader>zz :let &scrolloff=12-&scrolloff<CR>
:nnoremap <Leader>zx :let &scrolloff=99999-&scrolloff<CR>

" list and choose buffers easily 
" nmap <leader>b :ls<CR>:buffer<Space>

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

" autocomplete
" set iskeyword+=-
"set completeopt=longest,menu
function! InsertTabWrapper()
    let col = col(".") - 1
    if !col || getline(".")[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
endfunction

"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-p>

" remap : to space
nnoremap <space> :

" Use double-<space> to save the file
nnoremap <space><space> :w<cr>

" remap tab completion to control space
inoremap <c-space> <c-n>

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
"let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"let g:clang_snippets = 1

" SYNTASTIC stuff

" Show sidebar signs.
"let g:syntastic_enable_signs=1
" Tell it to use clang instead of gcc
"let g:syntastic_objc_compiler = 'clang'
"let g:syntastic_objc_check_header = 1
"
" Read the clang complete file
"let g:syntastic_objc_config_file = '.clang_complete'
"
" Tell it to use clang instead of gcc
"let g:syntastic_objc_checker = 'clang'

" phpdocs
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>p :call pdv#DocumentWithSnip()<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
map <leader>use :UltiSnipsEdit<CR>

"-------------Visuals--------------"
colorscheme atom-dark                       " set the color scheme to atom-dark
if has("gui_running")
    set macligatures                            " add the crazy Fira Code glyphs
endif
set guifont=Fira_Code:h12                   " set the font to Fira_Code height 12
set linespace=5                             " set the line spacing

set number
nnoremap <leader>n :set nonumber!<CR>

set guioptions-=e                           " remove gui tabs
set guioptions-=l                           " remove the left scrollbar
set guioptions-=L                           " remove the left scrollbar in a vertical window
set guioptions-=r                           " remove the right scrollbar
set guioptions-=R                           " remove the right scrollbar in a vertical window

hi LineNr guibg=bg
set foldcolumn=1
hi foldcolumn guibg=bg

"-------------Searching--------------"
set hlsearch
set incsearch
set ignorecase
set smartcase

" clear highlighting
nmap <leader>/ :noh<return>
nmap <silent> <BS>  :noh<CR>

" global search/replace with confirm
nmap  SS  :%s//gc<LEFT><LEFT><LEFT>

" global search/replace from a visual with confirm
nmap <expr>  M  ':%s/' . @/ . '//gc<LEFT><LEFT><LEFT>'

"----Search Plugins----"

" Greplace.vim
set grepprg=ag                                          " use ag for search
let g:grep_cmd_opts = '--line-numbers --noheading'

" Ag
" Ag the word under cursor
nmap <leader>* byw:Ag <C-R>"<CR>


" search for a string
nmap <Leader>f :Ag<space>

" tell ag to start search from project root
let g:ag_working_path_mode="r"
let g:ag_prg='ag -U -S --vimgrep'

"-------------Splits--------------"
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"-------------Undos--------------"

if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.VIM_UNDO_FILES
    set undofile
endif

"-------------Mappings--------------"

" Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Make it easy to edit the Vimrc plugins file.
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

" jump to last file
nnoremap <leader><leader><leader> <c-^>

" search for a tag
nmap <Leader>ft :tag<space>

" reindex laravel tags database
nmap <Leader>nvrt :!ctags -R --exclude=node_modules --exclude=public --exclude=vendor --PHP-kinds=+cfi<cr>
nmap <Leader>rt :!ctags -R --exclude=node_modules --exclude=public --PHP-kinds=+cfi<cr>

"-------------Laravel-Specific--------------"

" shortcut to routes file
nmap <Leader>lr :e app/Http/routes.php<cr>

" shortcut to artisan make
nmap <Leader>lm :!php artisan make:

" shortcut to find a controller
nmap <Leader>lc :CommandT<cr>app/Http/Controllers/
" shortcut to find a model
nmap <Leader>lm :CommandT<cr>app/
" shortcut to find a view
nmap <Leader>lv :CommandT<cr>resources/views/
" shortcut to find a static asset
nmap <Leader>la :CommandT<cr>resources/assets/
" shortcut to find a database migration
nmap <Leader>ldm :CommandT<cr>database/migrations/

"-------------PHP-Specific--------------"

" import classes under cursor (requires tags file)
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" expand to fully qualified class name in use statement
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php noremap <Leader>uf :call PhpExpandClass()<CR>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"-------------Plugin Mappings--------------"

" NerdTree - File navigation
map <Leader>r :NERDTreeToggle<CR>  
map <Leader>rm :NERDTreeMirror<CR>  
map <Leader>rf :NERDTreeFind<CR>  
let NERDTreeShowHidden = 1
let NERDTreeHijackNetrw = 0

" CommandT
let g:CommandTWildIgnore=&wildignore . ",**/node_modules*,**/storage*,**app/storage*,**/*.un~,**/*.png"
let g:CommandTMaxHeight=15
let g:CommandTMatchWindowReverse=1
map <leader>t :CommandT<CR>
imap <leader>t <ESC>:CommandT<CR>
map <leader>ctf :CommandTFlush<CR>
nnoremap <silent> <leader>b :CommandTMRU<CR>

" php cs fixer
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

" easy motion - incremental search
" <leader><leader>w

"-------------Auto-Commands--------------"

"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"-------------Experimental--------------"

nmap <leader>gt :GundoToggle<CR>
let g:tagbar_autofocus=1
nmap <F8> :TagbarToggle<CR>
