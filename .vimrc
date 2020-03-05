" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" UI
set gfn=Monaco:h16
set linespace=2

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
nnoremap <D-\> :Ag<SPACE>

" Open ctrl-p selection in new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Nerdtree
au vimenter * if !argc() | NERDTree | endif
let g:NERDTreeMapOpenInTab = '<2-LeftMouse>'

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set autoread    " Vim automatically refresh any files
set ruler       " show the line number on the bar

" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When on uses space instead of tabs
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

"indentation
set autoindent
set smartindent

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

" maps
inoremap <c-s> <c-o>:w<CR>
map <D-k> :NERDTreeFind<CR>
vnoremap <c-f> y/<C-R>"<CR>
" Press F4 to toggle highlighting on/off, and show current value.
noremap <c-h> :set hlsearch! hlsearch?<CR>
" change color of search highlight
hi Search guibg=red
hi Search guifg=white

" Vundle Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'haya14busa/incsearch.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tomtom/tcomment_vim'

execute pathogen#infect()
call pathogen#helptags()
