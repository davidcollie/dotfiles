"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
set nocompatible

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"
  " Run shell script if exist on custom select language
  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'machakann/vim-highlightedyank'  "highlight yanked text
Plug 'tpope/vim-commentary'           "comment out blocks of code using gc action
Plug 'tpope/vim-fugitive'             "git integration
Plug '/usr/local/opt/fzf'             "fuzzy search files
Plug 'junegunn/fzf.vim'               "fuzzy search files
Plug 'itchyny/lightline.vim'          "lightweight status bar
Plug 'sheerun/vim-polyglot'           "syntax highlighting
Plug 'Raimondi/delimitMate'           "auto closing of quotes, braces, etc...
Plug 'Yggdroot/indentLine'            "show vertical indentation lines

"" Completion
Plug 'ervandew/supertab'

"" Color
Plug 'frankier/neovim-colors-solarized-truecolor-only'

"" Javascript Bundle
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'posva/vim-vue'

"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'

call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" auto change windows present working directory to file being edited
" autocmd BufEnter * silent! lcd %:p:h
set autochdir

highlight ColorColumn ctermbg=59 guibg=#333333
let &colorcolumn=join(range(100,500),",")

set showbreak=↪\ 
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

" Set to auto read when a file is changed from the outside
set autoread

"turn on indenting
set smartindent

"" Encoding
set bomb
set binary
" set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

set nowrap

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch " show matching brackets"

"" Directories for swp files
set nobackup
set nowb
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1

set termguicolors
set background=dark
colorscheme solarized

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"" html, css, scss
augroup vimrc-html-css
  autocmd!
  autocmd FileType css,html,scss set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END

"" Include mappings
if filereadable(expand("~/.config/nvim/mappings.vim"))
  source ~/.config/nvim/mappings.vim
endif

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" Javascript
let g:javascript_enable_domhtmlcss = 1
