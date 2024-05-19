command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
	echo a:cmdline
	let expanded_cmdline = a:cmdline
	for part in split(a:cmdline, ' ')
	    if part[0] =~ '\v[%#<]'
	    	let expanded_part = fnameescape(expand(part))
	      	let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
	    endif
	endfor
	botright new
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
	call setline(1, 'You entered:    ' . a:cmdline)
	call setline(2, 'Expanded Form:  ' .expanded_cmdline)
	call setline(3,substitute(getline(2),'.','=','g'))
	execute '$read !'. expanded_cmdline
	setlocal nomodifiable
endfunction

command! -complete=file -nargs=* Git call s:RunShellCommand('git '.<q-args>)
command! -complete=file -nargs=* Test call s:RunShellCommand('make test')

augroup ReduceNoise
	    autocmd!
	        " Automatically resize active split to 85 width
        autocmd WinEnter * :call ResizeSplits()
augroup END
			"
function! ResizeSplits()
	set winwidth=150
    wincmd =
endfunction

autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal signcolumn=auto

autocmd WinLeave * setlocal nocursorline
autocmd WinLeave * setlocal signcolumn=no

" Change status line automatically when moving between buffers and windows
""augroup Statusline
""	autocmd!
""	autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
""    autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
""augroup END
""fu! SaveSess()
""    execute 'mksession! ' . getcwd() . '/.session.vim'
""endfunction
""
""fu! RestoreSess()
""if filereadable(getcwd() . '/.session.vim')
""    execute 'so ' . getcwd() . '/.session.vim'
""    if bufexists(1)
""        for l in range(1, bufnr('$'))
""            if bufwinnr(l) == -1
""                exec 'sbuffer ' . l
""            endif
""        endfor
""    endif
""endif
""endfunction
""
""autocmd VimLeave * call SaveSess()
""autocmd VimEnter * nested call RestoreSess()
