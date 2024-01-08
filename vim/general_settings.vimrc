" Set so that it is not using vi "
set nocompatible

filetype off

" Redo Keybinds 
" change the mapleader from \ to ,
let mapleader=" "
"set clipboard=unnamedplus
"noremap <Leader>y "+y
"noremap <Leader>p "+p
noremap Y "+y
noremap P "+p
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>w :w\|bd<cr>

" Remap buffer select
map <leader>n :bnext<cr>
map <leader>p :bprevious<cr>
map <leader>q :bdelete<cr>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Remap Split Select
map <leader>r <C-w><C-r>


" --- General Settings --- "
set hidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
syntax on
set nobackup
set noswapfile
set modelines=0
set relativenumber

" Turn on mouse selecting so that you can use mouse to move cursor
set mouse=a
" --- END GENERAL Settings --- "
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!make run' shellescape(@%, 1)<CR>
