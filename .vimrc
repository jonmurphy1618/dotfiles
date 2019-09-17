set encoding=utf-8
set number
" show matching ()[]{}
set showmatch

" Syntax highlighting
syntax enable
let python_highlight_all = 1


" Folding
set foldenable " enable folding
set foldmethod=indent
set foldlevelstart=99
nnoremap <space> za " rebind folding to spacebar

" Python indentation per PEP 8
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Fullstack indentation
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Flag whitespace
au BufRead, BufNewFile *.py,*.pyw,*.h match BadWhitespace /\s\+$/
