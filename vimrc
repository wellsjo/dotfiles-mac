
" ======= Plugins ======

call plug#begin('~/.vim/plugged')

" Visual
Plug 'ConradIrwin/vim-bracketed-paste'      " better copy-paste in insert mode
Plug 'jlanzarotta/bufexplorer'              " buffer exploring
Plug 'scrooloose/nerdtree'                  " file explorer (nerd tree)
Plug 'jistr/vim-nerdtree-tabs'              " persistent nerd tree
Plug 'vim-airline/vim-airline'              " better status bar
Plug 'vim-airline/vim-airline-themes'       " status bar theme
Plug 'wesQ3/vim-windowswap'                 " swap windows
Plug 'gcmt/taboo.vim'                       " better tabs
Plug 'mhinz/vim-startify'                   " start screen
Plug 'DataWraith/auto_mkdir'                " mkdir -p for creating files
Plug 'sjl/gundo.vim'                        " view undo tree

" Functionality
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'                             " async syntax checking
Plug 'vim-scripts/mru.vim'                  " recently opened files (mru)
Plug 'easymotion/vim-easymotion'            " targeted movement
Plug 'jiangmiao/auto-pairs'                 " auto pair brakcets, parens, quotes
Plug 'airblade/vim-gitgutter'               " show diff in code
Plug 'terryma/vim-smooth-scroll'            " better scrolling
Plug 'tpope/vim-surround'                   " surround words with characters
Plug 'tpope/vim-commentary'                 " easily comment out code
Plug 'tpope/vim-repeat'                     " better repeat (.)
Plug 'tpope/vim-fugitive'                   " git integration
Plug 'ntpeters/vim-better-whitespace'       " whitespace handler
Plug 'wellsjo/vim-save-cursor-position'     " Save cursor position when you exit files

" Languages
Plug 'pangloss/vim-javascript'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'gf3/peg.vim'
Plug 'fatih/vim-go'
Plug 'chr4/nginx.vim'

" Color Schemes
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'wellsjo/wellsokai.vim'
Plug 'endel/vim-github-colorscheme'
Plug 'google/vim-colorscheme-primary'
Plug 'nightsense/seabird'
Plug 'nightsense/simplifysimplify'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" =============================================================================

if has("mac")
  set shortmess+=c                    " Getsrid of annoying error messages
endif
set autochdir                       " Working directory is always same as the file
set showcmd                         " Show the command as you type

" Search
set ignorecase                      " Case-insensitive search
set smartcase                       " Case-sensitive search when using caps
set incsearch                       " Show match while typing pattern
set hlsearch                        " Highlight search results

" Colors, syntax
syntax on                           " Syntax highlighting
set number                          " Show number lines
set autoindent
filetype plugin indent on
let t_Co=256
let mapleader=" "
let g:netrw_dirhistmax = 0
set term=screen-256color
colorscheme wellsokai
" colorscheme github

" editing, tabs, indenting
set expandtab                       " Tab key creates spaces
set smarttab
set cindent
set tabstop=2                       " Number of space for tab character
set softtabstop=2                   " Number of spaces in tab when editing
set shiftwidth=2                    " Number of spaces used for >>, <<, ==
set backspace=2                     " Best backspace setting
scriptencoding utf-8
set encoding=utf-8

" status bar
set laststatus=2
" set cursorline
set nocursorcolumn

" Enable mouse/trackpad input
if has("mouse")
  set mouse=a
endif

" Enables resizing vim panes from tmux
if &term =~ '^screen'
  set ttymouse=xterm2
endif

" Toggle search and highlight words under cursor
nnoremap <c-f> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls!<CR>

" fzf
map <c-t> :FZF<CR>

" Fast quit
nnoremap <leader>q :q<CR>

" Quick write
nnoremap <leader>f :w<CR>

" Quick way to format a file
nnoremap <leader>g gg=G''zz

" Save while in insert mode with 'jj'
inoremap jj <esc>:w<CR>

" Stop editing in place with 'jk'
inoremap jk <esc>:<cr><right>

" Quickly switch tabs
nnoremap gr gT

" Tab to switch buffers
nnoremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>

" Arrow keys to resize windows
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>
nnoremap <Up> :resize +5<CR>
nnoremap <Down> :resize -5<CR>

" Auto-center search results
nnoremap n nzz
nnoremap N Nzz

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Move windiws with j, k, o, p
map <silent> <C-o> :wincmd h<CR>
map <silent> <C-p> :wincmd l<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-k> :wincmd k<CR>

" Yank line without newline character
nmap yu yg$

" File completion with control-f in insert mode
imap <c-f> <c-x><c-f>

" Better mapping for repeating macros
map , @

" Activate EasyMotion with space
map <Leader><Leader> <Plug>(easymotion-prefix)

" Search and replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Go def in new tab
autocmd FileType go nmap <silent> gd <Plug>(go-def-tab)

" let g:go_fmt_fail_silently = 1

" Persistent undo and swp files
set undofile
set undolevels=1000
set undoreload=1000
if !isdirectory(expand("~/.vim/.swap/"))
  silent !mkdir -p ~/.vim/.swap
endif
if !isdirectory(expand("~/.vim/.undo/"))
  silent !mkdir -p ~/.vim/.undo
endif
set directory^=~/.vim/.swap//
set undodir^=~/.vim/.undo//

" ======= Plugin Settings =======
let g:ale_fix_on_save = 0
let g:ale_fixers = {
\   'javascript': ['prettier'],
\}
let g:ale_linters = {
\   'javascript': ['prettier'],
\}

" vim-javascript
" Enable syntax highlighting for JSDoc comments
let g:javascript_plugin_jsdoc = 1

" vim-go
let g:go_def_mapping_enabled = 0
let g:go_def_reuse_buffer = 0
let g:go_fmt_command="goimports"


" use prettier for formatting
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'

" MRU
let MRU_File = $HOME . '/.vim_mru_files'
let MRU_Window_Height = 15
nnoremap mr :MRU<cr>

" Show whitespace
highlight ExtraWhitespace ctermbg=red

" Smooth scroll
nnoremap <CR> :call smooth_scroll#down(25, 20, 2)<cr>
nnoremap <silent> <c-d> :call smooth_scroll#down(15, 20, 2)<cr>
nnoremap <silent> <c-u> :call smooth_scroll#up(15, 20, 2)<cr>

" Nerd Tree settings
nnoremap \ :NERDTreeTabsToggle<Cr>
let NERDTreeWinSize = 30
let NERDTreeShowHidden=0
let NERDTreeCascadeSingleChildDir=0

" Taboo (tab labels)
let g:taboo_modified_tab_flag="+"
let g:taboo_tab_format=' %N. %f %m '

" Status line plugin
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme='bubblegum'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" UTF-8 airline symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Auto completion with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Setup python to use custom styles
" This is called in ftplugin/python.vim
function! SetupPython()
  setlocal softtabstop=2
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction
command! -bar SetupPython call SetupPython()
