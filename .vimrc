""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @copyright: Enrique Paredes
" @licensing:
"    <MIT License>http://www.opensource.org/licenses/mit-license.php
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""GENERAL OPTIONS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" Bundle conf
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Custom Bundles
Bundle 'Lokaltog/vim-easymotion'
" Bundle 'Shougo/neocomplete.vim'
" Bundle 'akracun/vitality.vim'
Bundle 'bling/vim-airline'
" Bundle 'chase/vim-ansible-yaml'
" Bundle 'davidhalter/jedi-vim'
Bundle 'godlygeek/tabular'
Bundle 'joeytwiddle/vim-multiple-cursors'
Bundle 'mattn/emmet-vim'
Bundle 'moll/vim-bbye'
" Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
" Bundle 'sheerun/vim-polyglot' ¡¡¡Este plugin ralentiza mucho vim!!!
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
" Bundle 'tpope/vim-vinegar'
" Bundle 'wikitopian/hardmode'
Bundle 'wincent/command-t'
Bundle 'scrooloose/nerdtree'
" Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-clojure-highlight'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'tpope/vim-surround'
" Bundle 'vim-scripts/VimClojure'

filetype plugin indent on         " EOF Bundle conf
syntax on 

set shortmess+=I
set nowrap
set autoread                      " Update when changed from outside
set autoindent                    " Indenting options
set smartindent
set ruler                         " show the cursor position all the time
set ts=4 sts=4 sw=4 expandtab     " Default tab flavour
set smarttab
set laststatus=2                  " Allways show status in bar

set backspace=indent,eol,start    " Normalize backspacing between os.

" set mouse=a                       " Mouse Configuration
" set mousefocus

colorscheme Tomorrow-Night-Eighties
set colorcolumn=119
match ErrorMsg '\%<101v.\%>100v'

set t_Co=256                        " Coloring Options
set background=dark 

set encoding=utf-8
set scrolloff=5
set sidescrolloff=5
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set nocursorline
set ttyfast
set nomodeline                      " disable commands inside files
set modelines=0

set incsearch                       " SEARCH OPTIONS
set smartcase

set display+=lastline               " 

set foldmethod=indent
set foldnestmax=3
set foldlevel=99

" set ofu=syntaxcomplete#Complete     " Onmi Completion options
set complete-=i                     " disable onmi to search in current path

set hlsearch                        " Highlight search things
set wildignore=*.obj,*.exe,*.pyc,*.pyo,*.pyx,*.*~,*.sw* 

set list
set listchars=tab:▸\ ,eol:¬,nbsp:⍽  " Use the nice symbols for tabstops and EOL

set visualbell                      " Error managing
set errorbells

set undofile                        " Persistent undo
set undodir=$HOME/.vim/undo         " folder to store changes
set undolevels=1000                 " changes that can be undone
set undoreload=10000                " lines to save on a buffer reload

set nobackup                        " no backups at all. It should be in CVS.
set noswapfile
set nowritebackup

set timeout 
set timeoutlen=180 
set ttimeoutlen=30

set relativenumber
set number

let g:rbpt_colorpairs = [
    \ ['brown',       'SeaGreen3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'SeaGreen3'],
    \ ['darkred',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',    'firebrick3'],
    \ ['darkgreen',   'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ]

let g:rbpt_max = 16

if has("autocmd")
    " When vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vim/.vimrc

    " help last-position-jump
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
        \    exe "normal! g`\"" | endif
    
    " start in a scratch buffer
    au VimEnter * if empty(expand('%')) | set buftype=nofile | endif
    
    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml

    " Autosave!
    autocmd BufLeave,FocusLost * if expand('%') != '' | update | endif

    " Syntax of these languages is fuzzy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType cucumber setlocal ts=4 sw=4 sts=4 expandtab

    " Customizations 
    autocmd FileType html setlocal nowrap

    " Nice commands output.
    autocmd VimEnter * :set t_ti= t_te=
    " review the below line with the info in :help restorescreen
    autocmd VimLeave * :set t_ti=7[r[?47h t_te=[?47l8

endif


if has("gui_running") " Graphical editor running
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ Semibold\ 10,Droid\ Sans\ Mono\ 10
    else
        set guifont=Source\ Code\ Pro\ Semibold:h13,Monaco:h14
    end
    set linespace=-1
endif

runtime! macros/matchit.vim

""KEYBOARD MAPS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enhance sometimes dumb fingers overriding ex commands
nnoremap ; :

" Treat long lines as break lines (breaks relativenumber count)
" nmap j gj
" nmap k gk


"Leader configuration
let mapleader = ","
let g:mapleader = ","

" window management
nmap <leader>s <C-w>s<C-w>j
nmap <leader>v <C-w>v<C-w>l 
nmap wh :wincmd h<CR>
nmap wj :wincmd j<CR>
nmap wk :wincmd k<CR>
nmap wl :wincmd l<CR>

" nmap ww :sp<CR>
nmap we :vsp<CR>
nmap wq :hide<CR>

" buffer cycling
nmap <C-k> :bn<cr>
nmap <C-j> :bp<cr>

"Shortcut to paste from outside vim
nmap <leader>p "+p<CR>

"rapid .vimrc edit
nmap <leader>V :edit ~/.vim/.vimrc<CR>

" Normalized escape
imap <C-c> <esc>
imap <C-\> <esc>:w<CR>
map <C-\> <esc>:w<CR>

" Close the current buffer
nmap <leader>d :Bdelete!<CR>
nmap <leader>q :qall!<CR>

" Close all the buffers
nnoremap <leader><leader> <c-^>

" jk is escape
inoremap jk <esc>
cnoremap jk <esc> 
vnoremap jk <esc> 
inoremap JK <esc>
cnoremap JK <esc> 
vnoremap JK <esc> 

" Cursor
nmap J }
nmap K {
nmap H 0
nmap L $
nmap M G
nmap U gg

vmap J }
vmap K {
vmap H 0
vmap L $
vmap M G
vmap U gg

" Emmet 
imap jm <C-Y><leader>
vmap jm <C-Y><leader>
imap jmj <c-y>d
imap jmk <c-y>D
imap jmn <c-y>l
imap jmN <c-y>d

" Vimclojure
nmap zz :Require <CR>
nmap zx cpp
vmap zx :Eval <CR>
imap zx cpp
nmap ZX cpp
vmap ZX :Eval <CR>
imap ZX cpp

" Tcomment
nmap cc gcc
vmap cc gcc<leader>

" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

nmap - :CommandT <CR>
nmap _ :call OpenNERDTree() <CR>
nmap __ :call CloseNERDTree() <CR>

let g:nerdstate = 'closed'
function! OpenNERDTree()
    if g:nerdstate == 'closed'
        let g:nerdstate = 'opened'
        exec ':NERDTree'
    elseif g:nerdstate == 'opened'
        exec ':NERDTreeFocus'
    endif
endfunction

function! CloseNERDTree()
    if g:nerdstate == 'opened'
        let g:nerdstate = 'closed'
        exec ':NERDTreeClose'
    endif
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>


""PLUGINS CONFIGURATION"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NerdTree
nmap <leader>t :NERDTree<CR>
let NERDTreeShowHidden = 1

"Command T 
map <leader>f :CommandTFlush <cr>\|:CommandT<cr>

"syntastic
let g:syntastic_check_on_open=0
let g:syntastic_error_symbol = '▸'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '§'
let g:syntastic_style_warning_symbol='~'

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:bufferline_echo=0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Hard{core,mode} vim!
map <leader>H :call ToggleHardMode()<CR>

" Tabularize
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction 

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
