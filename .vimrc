" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set mouse=a
set number
syntax enable

" Theme
colorscheme monokai

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Nerdtree
au vimenter * if !argc() | NERDTree | endif

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

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Vundle Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'haya14busa/incsearch.vim'

execute pathogen#infect()
call pathogen#helptags()
