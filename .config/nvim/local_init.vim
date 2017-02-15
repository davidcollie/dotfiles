" auto change windows present working directory to file being edited
autocmd BufEnter * silent! lcd %:p:h

"no arrow function keys
set noesckeys

set nowrap
set incsearch "Make search act like search in modern browsers
set showmatch " show matching brackets"

set ignorecase "Ignore case when searching
set smartcase

"turn on indenting
set smartindent

highlight ColorColumn ctermbg=59 guibg=#333333
let &colorcolumn=join(range(100,500),",")

set listchars=tab:»\ ,nbsp:·,trail:·,extends:>,precedes:<
set list

" Set to auto read when a file is changed from the outside
set autoread
