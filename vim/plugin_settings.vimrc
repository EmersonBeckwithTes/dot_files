""source ~/.vim/coc_settings.vim
" NerdTree Config
" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
source ~/.vim/coc_config.vimrc
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0 " Set to one to open on startup
let NERDTreeMapOpenInTab='<TAB>'
let g:NERDTreeQuitOnOpen = 1
let NERDTreeMapOpenInTabSilent='<ENTER>'
nmap <leader>r :NERDTreeFind<cr>


""" --- Using CoC for Code Completion and sourcing
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()
let g:coc_node_path = '/Users/ebeckwith/.nvm/versions/node/v21.7.1/bin/node'
"
"
"" --- Setup Syntastic -- "
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

function Gitbranch()
    return trim(system("git branch 2> /dev/null | sed -e 's/..//'"))
endfunction
set statusline+=\ %t%y\~(%{Gitbranch()})
"
""let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height=0
