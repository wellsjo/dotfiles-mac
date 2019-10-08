" $HOME/.vim/ftplugin/go.vim

nmap <silent> <buffer> <Leader>h : <C-u>call GOVIMHover()<CR>

nmap <silent> <buffer> <F2> :execute "GOVIMQuickfixDiagnostics" | cw | if len(getqflist()) > 0 && getwininfo(win_getid())[0].quickfix == 1 | :wincmd p | endif<CR>
imap <silent> <buffer> <F2> <C-O>:execute "GOVIMQuickfixDiagnostics" | cw | if len(getqflist()) > 0 && getwininfo(win_getid())[0].quickfix == 1 | :wincmd p | endif<CR>
