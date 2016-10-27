set mouse=a
set number
syntax enable

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set autoread    " Vim automatically refresh any files
set tabstop=4   " Set tabs to 4 spaces
set ruler       " show the line number on the bar

" Autocomplete
set wildmenu
set wildmode=longest:list

" JSON Syntax
autocmd BufNewFile,BufRead *.json set ft=javascript

" Show current directory
set laststatus=2
set statusline=%!getcwd()

