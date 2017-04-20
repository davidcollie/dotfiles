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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'

"" Linting
Plug 'neomake/neomake'

"" Completion
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"" Javascript completion
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }

"" Color
Plug 'frankier/neovim-colors-solarized-truecolor-only'

"" Javascript Bundle
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'posva/vim-vue'

"" Ruby Bundle
Plug 'vim-ruby/vim-ruby'

"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'

"" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" auto change windows present working directory to file being edited
autocmd BufEnter * silent! lcd %:p:h

highlight ColorColumn ctermbg=59 guibg=#333333
let &colorcolumn=join(range(100,500),",")

set listchars=tab:�\ ,nbsp:�,trail:�,extends:>,precedes:<
set list

" Set to auto read when a file is changed from the outside
set autoread

"turn on indenting
set smartindent

"" Encoding
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

"no arrow function keys
set noesckeys

set nowrap

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch " show matching brackets"

"" Encoding
set bomb
set binary

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

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" grep.vim
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

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

if filereadable(expand("~/.config/nvim/python"))
  source ~/.config/nvim/python.vim
endif

if filereadable(expand("~/.config/nvim/javascript.vim"))
  source ~/.config/nvim/javascript.vim
endif

if filereadable(expand("~/.config/nvim/ruby.vim"))
  source ~/.config/nvim/ruby.vim
endif

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
endif

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
\]
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ruby = ['omni']

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Same as default except that I remove the 'u' option
set complete=.,w,b,t
let g:SuperTabDefaultCompletionType = "context"
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1

" neomake
autocmd! BufWritePost * Neomake

let g:neomake_javascript_jshint_maker = {
      \ 'args': [],
      \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
      \ }
let g:neomake_javascript_enabled_makers = ['eslint']
