" Copyright (c) 2014 Marco Hinz
" All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are met:
"
" - Redistributions of source code must retain the above copyright notice, this
"   list of conditions and the following disclaimer.
" - Redistributions in binary form must reproduce the above copyright notice,
"   this list of conditions and the following disclaimer in the documentation
"   and/or other materials provided with the distribution.
" - Neither the name of the author nor the names of its contributors may be
"   used to endorse or promote products derived from this software without
"   specific prior written permission.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
" ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
" LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
" INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
" CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
" ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
" POSSIBILITY OF SUCH DAMAGE.

if exists('g:loaded_blockify') || &cp || !exists('##CursorMoved') || !exists('##CursorMovedI')
  finish
endif
let g:loaded_blockify = 1

let s:group      = get(g:, 'blockify_highlight_group', 'MatchParen')
let s:everything = get(g:, 'blockify_highlight_everything')
let s:prio       = get(g:, 'blockify_match_priority', 42)
let s:id         = get(g:, 'blockify_match_id', 666)
let s:default    = [ '{', '}' ]

let s:pairs = {
      \ 'vim':        [ '\<if\>', '\<endif\>' ],
      \ 'clojure':    [ '(', ')' ],
      \}

if exists('g:blockify_pairs')
  call extend(s:pairs, g:blockify_pairs)
endif

autocmd BufEnter * call s:set_at_enter_buf()

function! s:set_at_enter_buf() abort
  if &filetype !=# 'help'
    augroup matchparenalways
      autocmd!
      autocmd CursorMoved,CursorMovedI <buffer> call <sid>highlight_block()
    augroup END
  endif
endfunction

function! s:highlight_block() abort
  if exists('w:match')
    silent! call matchdelete(w:match)
  endif

  if getchar(1) != 0
    "debounce
    return
  endif

  if exists('w:paren_hl_on') && w:paren_hl_on
    return
  endif

  let char_open  = get(s:pairs, &ft, s:default)[0]
  let char_close = get(s:pairs, &ft, s:default)[1]

  let curchar = matchstr(getline('.'), '.', col('.')-1)
  if curchar != char_open
    let pos_open = searchpairpos(char_open, '', char_close, 'Wnb', '', 0, 20)
  endif
  if curchar != char_close
    let pos_close = searchpairpos(char_open, '', char_close, 'Wn', '', 0, 20)
  endif

  if s:everything
    if exists('pos_open') && exists('pos_close')
      let pos_close[1] += 1
      let w:match = matchadd(s:group, '\%'. pos_open[0] .'l\%'. pos_open[1] .'c.*\_.\+\%'. pos_close[0] .'l\%'. pos_close[1] .'c', s:prio, s:id)
    endif
  else
    if exists('pos_open') && exists('pos_close')
      let w:match = matchadd(s:group, '\%(\%'. pos_open[0] .'l\%'. pos_open[1] .'c\)\|\(\%'. pos_close[0] .'l\%'. pos_close[1] .'c\)', s:prio, s:id)
    elseif exists('pos_open')
      let w:match = matchadd(s:group, '\%(\%'. pos_open[0] .'l\%'. pos_open[1] .'c\)', s:prio, s:id)
    else
      let w:match = matchadd(s:group, '\%(\%'. pos_close[0] .'l\%'. pos_close[1] .'c\)', s:prio, s:id)
    endif
  endif
endfunction

" vim:set et sw=2 sts=2:
