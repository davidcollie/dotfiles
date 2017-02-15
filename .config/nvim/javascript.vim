let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
  autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
augroup END


