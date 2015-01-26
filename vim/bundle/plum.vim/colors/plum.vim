" ============================================================================
" File: plum.vim
" Description: Plum, a vim colorscheme for any occasion.
" Mantainer: Giacomo Comitti - https://github.com/gcmt
" Url: https://github.com/gcmt/plum.vim
" License: MIT
" Last Changed: 22 Dec 2013
" ============================================================================


" Init {{{

let s:curr_bg = &bg

hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "plum"

let plum_cursorline_style =
    \ get(g:, "plum_cursorline_style", 1)
"
" styles:
"   - 1: Highlight both the current line and the current line number.
"   - 2: Highlight only the current line.
"   - 3: Highlight only the current line number.
"

" }}}

" Colors {{{

" dark-bg colors
let s:dark = {
  \ "fg" : ["65658a", 247],
  \ "bg" : ["000116", 233],
  \ "darkerfg" : ["44486a", 239],
  \ "lighterbg1" : ["15161f", 234],
  \ "lighterbg2" : ["26283a", 235],
  \ "pink" : ["603e76", 170],
  \ "plum" : ["4b2b55", 53],
  \ "blue" : ["2d4579", 25],
  \ "paleblue" : ["3a3c68", 236],
  \ "cyan" : ["2b5362", 29],
  \ "orange" : ["665450", 173],
  \ "grey" : ["606069", 239],
  \ "red" : ["612555", 198],
  \ "lightblue": ["b5d5ff", 69],
  \ "lightgrey" : ["cccccc", 242],
\ }

" light-bg colors
let s:light = {
  \ "fg" : ["4f4f4f", 238],
  \ "bg" : ["f9f9f9", 255],
  \ "blue" : ["4271ae", 25],
  \ "lightblue" : ["b5d5ff", 153],
  \ "cyan" : ["3e999f", 31],
  \ "red" : ["d70000", 160],
  \ "lightred" : ["f05145", 203],
  \ "orange" : ["f5871f", 208],
  \ "purple" : ["8959a8", 97],
  \ "green" : ["718c00", 64],
  \ "yellow" : ["ffff55", 227],
  \ "gold" : ["e2b100", 178],
  \ "grey1" : ["808080", 243],
  \ "grey2" : ["b3b3b3", 250],
  \ "grey3" : ["cccccc", 251],
  \ "grey4" : ["efefef", 254],
\ }

" }}}

    fu! <SID>H(hl)  " {{{
        if s:curr_bg == "dark"
            if !empty(a:hl.dark.fg)
                exec "hi " . a:hl.group . " guifg=#" . a:hl.dark.fg[0] . " ctermfg=" . a:hl.dark.fg[1]
            endif
            if !empty(a:hl.dark.bg)
                exec "hi " . a:hl.group . " guibg=#" . a:hl.dark.bg[0] . " ctermbg=" . a:hl.dark.bg[1]
            endif
        else
            if !empty(a:hl.light.fg)
                exec "hi " . a:hl.group . " guifg=#" . a:hl.light.fg[0] . " ctermfg=" . a:hl.light.fg[1]
            endif
            if !empty(a:hl.light.bg)
                exec "hi " . a:hl.group . " guibg=#" . a:hl.light.bg[0] . " ctermbg=" . a:hl.light.bg[1]
            endif
        endif
        if a:hl.style != ""
            exec "hi " . a:hl.group . " gui=" . a:hl.style . " cterm=" . a:hl.style
        endif
    endfun  " }}}

if has("gui_running") || &t_Co == 88 || &t_Co == 256

    " Normal text {{{

    " normal text
    call <SID>H(
    \ {
        \ 'group': "Normal",
        \ 'dark' : {'fg': s:dark.fg, 'bg': s:dark.bg},
        \ 'light': {'fg': s:light.fg, 'bg': s:light.bg},
        \ 'style': "",
    \ })

    " }}}

    " Cursor {{{

    " the character under the cursor
    call <SID>H(
    \ {
        \ 'group': "Cursor",
        \ 'dark': {'fg': '', 'bg': s:dark.cyan},
        \ 'light': {'fg': '', 'bg': s:light.lightred},
        \ 'style': "",
    \ })

    " }}}

    " Not text {{{

    " '~' and '@' at the end of the window, characters from 'showbreak' and
    " other characters that do not really exist in the text (e.g., '>'
    " displayed when a double-wide character doesn't fit at the end of the
    " line).
    call <SID>H(
    \ {
        \ 'group': "NonText",
        \ 'dark': {'fg': s:dark.blue, 'bg': ''},
        \ 'light': {'fg': s:light.blue, 'bg': ''},
        \ 'style': "none",
    \ })

    " meta and special keys listed with ':map', also for text used to show
    " unprintable characters in the text, 'listchars'. Generally: text that is
    " displayed differently from what it really is.
    call <SID>H(
    \ {
        \ 'group': "SpecialKey",
        \ 'dark': {'fg': s:dark.lighterbg2, 'bg': s:dark.bg},
        \ 'light': {'fg': s:light.grey2, 'bg': s:light.bg},
        \ 'style': "none",
    \ })

    " }}}

    " Search {{{

    " last search pattern highlighting (see 'hlsearch'). Also used for
    " highlighting the current line in the quickfix window and similar items
    " that need to stand out.
    call <SID>H(
    \ {
        \ 'group': "Search",
        \ 'dark': {'fg': '', 'bg': s:dark.red},
        \ 'light': {'fg': '', 'bg': s:light.yellow},
        \ 'style': ""
    \ })

    " 'incsearch' highlighting; also used for the text replaced with ':s///c'
    call <SID>H(
    \ {
        \ 'group': "IncSearch",
        \ 'dark': {'fg': s:dark.red, 'bg': s:dark.fg},
        \ 'light': {'fg': s:light.yellow, 'bg': s:light.fg},
        \ 'style': ""
    \ })

    " }}}

    " Status line {{{

    " status line of current window
    call <SID>H(
    \ {
        \ 'group': "StatusLine",
        \ 'dark': {'fg': s:dark.blue, 'bg': s:dark.lighterbg1},
        \ 'light': {'fg': s:light.blue, 'bg': s:light.grey4},
        \ 'style': "none"
    \ })

    " status lines of not-current windows
    call <SID>H(
    \ {
        \ 'group': "StatusLineNC",
        \ 'dark': {'fg': s:dark.lighterbg1, 'bg': s:dark.paleblue},
        \ 'light': {'fg': s:light.grey4, 'bg': s:light.grey2},
        \ 'style': "inverse"
    \ })

    " custom highlighting
    call <SID>H(
    \ {
        \ 'group': "StatusLineErr",
        \ 'dark': {'fg': s:dark.red, 'bg': s:dark.lighterbg1},
        \ 'light': {'fg': s:light.lightred, 'bg': s:light.grey4},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "StatusLineBold",
        \ 'dark': {'fg': s:dark.blue, 'bg': s:dark.lighterbg1},
        \ 'light': {'fg': s:light.blue, 'bg': s:light.grey4},
        \ 'style': "bold"
    \ })

    " }}}

    " Vertical split {{{

    " the column separating vertically split windows
    call <SID>H(
    \ {
        \ 'group': "VertSplit",
        \ 'dark': {'fg': s:dark.bg, 'bg': s:dark.lighterbg2},
        \ 'light': {'fg': s:light.bg, 'bg': s:light.blue},
        \ 'style': "inverse"
    \ })

    " }}}

    " Visual {{{

    " visual mode selection
    call <SID>H(
    \ {
        \ 'group': "Visual",
        \ 'dark': {'fg': '', 'bg': s:dark.lighterbg2},
        \ 'light': {'fg': '', 'bg': s:light.lightblue},
        \ 'style': ""
    \ })

    " The character under the cursor or just before it, if it is a paired bracket, and its match.
    call <SID>H(
    \ {
        \ 'group': "MatchParen",
        \ 'dark': {'fg': '', 'bg': s:dark.lighterbg2},
        \ 'light': {'fg': '', 'bg': s:light.lightblue},
        \ 'style': ""
    \ })

    " }}}

    " Directory {{{

    " directory names (and other special names in listings
    call <SID>H(
    \ {
        \ 'group': "Directory",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.purple, 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    " Fold {{{

    " line used for closed folds
    call <SID>H(
    \ {
        \ 'group': "Folded",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': s:dark.bg},
        \ 'light': {'fg': s:light.grey1, 'bg': s:light.bg},
        \ 'style': ""
    \ })

    " see 'foldcolumn'
    call <SID>H(
    \ {
        \ 'group': "FoldColumn",
        \ 'dark': {'fg': s:dark.grey, 'bg': s:dark.bg},
        \ 'light': {'fg': s:light.gold, 'bg': s:light.bg},
        \ 'style': ""
    \ })

    " }}}

    " Command line messages {{{

    " warning messages
    call <SID>H(
    \ {
        \ 'group': "WarningMsg",
        \ 'dark': {'fg': s:dark.red, 'bg': s:dark.bg},
        \ 'light': {'fg': s:light.lightred, 'bg': s:light.bg},
        \ 'style': ""
    \ })

    " error messages on the command line
    call <SID>H(
    \ {
        \ 'group': "ErrorMsg",
        \ 'dark': {'fg': s:dark.red, 'bg': s:dark.bg},
        \ 'light': {'fg': s:light.lightred, 'bg': s:light.bg},
        \ 'style': ""
    \ })

    " 'showmode' message (e.g., '-- INSERT --')
    call <SID>H(
    \ {
        \ 'group': "ModeMsg",
        \ 'dark': {'fg': s:dark.cyan, 'bg': ''},
        \ 'light': {'fg': s:light.green, 'bg': ''},
        \ 'style': ""
    \ })

    " more-prompt
    call <SID>H(
    \ {
        \ 'group': "MoreMsg",
        \ 'dark': {'fg': s:dark.cyan, 'bg': ''},
        \ 'light': {'fg': s:light.green, 'bg': ''},
        \ 'style': ""
    \ })

    " hit-enter prompt and yes/no questions
    call <SID>H(
    \ {
        \ 'group': "Question",
        \ 'dark': {'fg': s:dark.cyan, 'bg': ''},
        \ 'light': {'fg': s:light.green, 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    " Wild menu {{{

    " current match in 'wildmenu' completion
    call <SID>H(
    \ {
        \ 'group': "WildMenu",
        \ 'dark': {'fg': s:dark.pink, 'bg': s:dark.lighterbg2},
        \ 'light': {'fg': s:light.blue, 'bg': s:light.lightblue},
        \ 'style': ""
    \ })

    " }}}

    " Sign column {{{

    " column where signs are displayed
    call <SID>H(
    \ {
        \ 'group': "SignColumn",
        \ 'dark': {'fg': '', 'bg': s:dark.bg},
        \ 'light': {'fg': '', 'bg': s:light.bg},
        \ 'style': ""
    \ })

    " }}}

    " Line number {{{

    " line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
    call <SID>H(
    \ {
        \ 'group': "Linenr",
        \ 'dark': {'fg': s:dark.lighterbg2, 'bg': ''},
        \ 'light': {'fg': s:light.grey3, 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    " Diff {{{

    " diff mode: Added line
    call <SID>H(
    \ {
        \ 'group': "DiffAdd",
        \ 'dark': {'fg': s:dark.bg, 'bg': s:dark.cyan},
        \ 'light': {'fg': s:light.bg, 'bg': s:light.green},
        \ 'style': ""
    \ })

    " diff mode: Deleted line
    call <SID>H(
    \ {
        \ 'group': "DiffDelete",
        \ 'dark': {'fg': s:dark.bg, 'bg': s:dark.red},
        \ 'light': {'fg': s:light.bg, 'bg': s:light.lightred},
        \ 'style': ""
    \ })

    " diff mode: Changed line
    call <SID>H(
    \ {
        \ 'group': "DiffChange",
        \ 'dark': {'fg': s:dark.bg, 'bg': s:dark.paleblue},
        \ 'light': {'fg': s:light.bg, 'bg': s:light.gold},
        \ 'style': ""
    \ })

    " diff mode: Changed text within a changed line
    call <SID>H(
    \ {
        \ 'group': "DiffText",
        \ 'dark': {'fg': s:dark.bg, 'bg': s:dark.red},
        \ 'light': {'fg': s:light.bg, 'bg': s:light.lightred},
        \ 'style': "none"
    \ })

    " }}}

    if version >= 700

    " Cursor line {{{

    let s:cursor_line_nr =
    \ {
        \ 'group': "CursorLineNr",
        \ 'dark': {'fg': s:dark.cyan, 'bg': ''},
        \ 'light': {'fg': s:light.lightred, 'bg': ''},
        \ 'style': "bold"
    \ }

    let s:cursor_line_nr_hidden =
    \ {
        \ 'group': "CursorLineNr",
        \ 'dark': {'fg': s:dark.lighterbg2, 'bg': ''},
        \ 'light': {'fg': s:light.grey3, 'bg': ''},
        \ 'style': "none"
    \ }

    let s:cursor_line =
    \ {
        \ 'group': "CursorLine",
        \ 'dark': {'fg': '', 'bg': s:dark.lighterbg1},
        \ 'light': {'fg': '', 'bg': s:light.grey4},
        \ 'style': "none"
    \ }

    let s:cursor_line_hidden =
    \ {
        \ 'group': "CursorLine",
        \ 'dark': {'fg': '', 'bg': s:dark.bg},
        \ 'light': {'fg': '', 'bg': s:light.bg},
        \ 'style': "none"
    \ }

    if g:plum_cursorline_style == 1
        call <SID>H(s:cursor_line)
        call <SID>H(s:cursor_line_nr)
    elseif g:plum_cursorline_style == 2
        call <SID>H(s:cursor_line)
        call <SID>H(s:cursor_line_nr_hidden)
    else
        call <SID>H(s:cursor_line_hidden)
        call <SID>H(s:cursor_line_nr)
    endif

    " }}}

    " Cursor column {{{

    " the screen column that the cursor is in when 'cursorcolumn' is set
    call <SID>H(
    \ {
        \ 'group': "CursorColumn",
        \ 'dark': {'fg': '', 'bg': s:dark.lighterbg1},
        \ 'light': {'fg': '', 'bg': s:light.grey4},
        \ 'style': ""
    \ })

    " }}}

    " Popup menu {{{

    " popup menu: normal item
    call <SID>H(
    \ {
        \ 'group': "PMenu",
        \ 'dark': {'fg': s:dark.blue, 'bg': s:dark.lightblue},
        \ 'light': {'fg': s:light.blue, 'bg': s:light.lightblue},
        \ 'style': "none"
    \ })

    " popup menu: selected item
    call <SID>H(
    \ {
        \ 'group': "PMenuSel",
        \ 'dark': {'fg': s:dark.lightblue, 'bg': s:dark.blue},
        \ 'light': {'fg': s:light.lightblue, 'bg': s:light.blue},
        \ 'style': "none"
    \ })

    " popup menu: scrollbar
    call <SID>H(
    \ {
        \ 'group': "PMenuSBar",
        \ 'dark': {'fg': s:dark.grey, 'bg': s:dark.grey},
        \ 'light': {'fg': s:light.grey1, 'bg': s:light.grey1},
        \ 'style': "none"
    \ })

    " popup menu: Thumb of the scrollbar
    call <SID>H(
    \ {
        \ 'group': "PMenuThumb",
        \ 'dark': {'fg': s:dark.grey, 'bg': s:dark.lightgrey},
        \ 'light': {'fg': s:light.grey1, 'bg': s:light.grey2},
        \ 'style': "none"
    \ })

    " }}}

    " Tabline {{{

    " tab pages line, not active tab page label
    call <SID>H(
    \ {
        \ 'group': "TabLine",
        \ 'dark': {'fg': s:dark.fg, 'bg': s:dark.lighterbg2},
        \ 'light': {'fg': s:light.grey1, 'bg': s:light.grey4},
        \ 'style': "none"
    \ })

    " tab pages line, active tab page label
    call <SID>H(
    \ {
        \ 'group': "TabLineSel",
        \ 'dark': {'fg': s:dark.bg, 'bg': s:dark.fg},
        \ 'light': {'fg': s:light.blue, 'bg': s:light.lightblue},
        \ 'style': "none"
    \ })

    " tab pages line, where there are no labels
    call <SID>H(
    \ {
        \ 'group': "TabLineFill",
        \ 'dark': {'fg': s:dark.lightgrey, 'bg': s:dark.lighterbg2},
        \ 'light': {'fg': s:light.grey2, 'bg': s:light.grey4},
        \ 'style': "none"
    \ })

    " }}}

    endif

    if version >= 703

    " ColorColum {{{

    " used for the columns set with 'colorcolumn'
    call <SID>H(
    \ {
        \ 'group': "ColorColumn",
        \ 'dark': {'fg': '', 'bg': s:dark.lighterbg1},
        \ 'light': {'fg': '', 'bg': s:light.grey4},
        \ 'style': ""
    \ })

    " }}}

    " Conceal {{{

    " placeholder characters substituted for concealed text (see
    " 'conceallevel')
    call <SID>H(
    \ {
        \ 'group': "Conceal",
        \ 'dark': {'fg': s:dark.lighterbg2, 'bg': s:dark.bg},
        \ 'light': {'fg': s:light.grey2, 'bg': s:light.bg},
        \ 'style': ""
    \ })

    " }}}

    " Spell {{{

    " word that is not recognized by the spellchecker. This will be combined with the
    " highlighting used otherwise
    call <SID>H(
    \ {
        \ 'group': "SpellBad",
        \ 'dark': {'fg': '', 'bg': ''},
        \ 'light': {'fg': '', 'bg': ''},
        \ 'style': "undercurl"
    \ })

    " word that should start with a capital. This will be combined with the highlighting
    " used otherwise
    call <SID>H(
    \ {
        \ 'group': "SpellCap",
        \ 'dark': {'fg': '', 'bg': ''},
        \ 'light': {'fg': '', 'bg': ''},
        \ 'style': ""
    \ })

    " word that is recognized by the spellchecker as one that is used in another region.
    " This will be combined with the highlighting used otherwise
    call <SID>H(
    \ {
        \ 'group': "SpellLocal",
        \ 'dark': {'fg': '', 'bg': ''},
        \ 'light': {'fg': '', 'bg': ''},
        \ 'style': ""
    \ })

    " word that is recognized by the spellchecker as one that is hardly ever used.
    " This will be combined with the highlighting used otherwise
    call <SID>H(
    \ {
        \ 'group': "SpellRare",
        \ 'dark': {'fg': '', 'bg': ''},
        \ 'light': {'fg': '', 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    endif

    " Standard Language Highlighting {{{

    " any constant
    call <SID>H(
    \ {
        \ 'group': "Constant",
        \ 'dark': {'fg': s:dark.grey, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

   " a string constant: 'this is a string'
    call <SID>H(
    \ {
        \ 'group': "String",
        \ 'dark': {'fg': s:dark.plum, 'bg': ''},
        \ 'light': {'fg': s:light.green, 'bg': ''},
        \ 'style': ""
    \ })

    " a character constant: 'c', '\n'
    call <SID>H(
    \ {
        \ 'group': "Character",
        \ 'dark': {'fg': s:dark.plum, 'bg': ''},
        \ 'light': {'fg': s:light.green, 'bg': ''},
        \ 'style': ""
    \ })

    " a number constant: 234, 0xff
    call <SID>H(
    \ {
        \ 'group': "Number",
        \ 'dark': {'fg': s:dark.grey, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " a boolean constant: TRUE, false
    call <SID>H(
    \ {
        \ 'group': "Boolean",
        \ 'dark': {'fg': s:dark.grey, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " a floating point constant: 2.3e10
    call <SID>H(
    \ {
        \ 'group': "Float",
        \ 'dark': {'fg': s:dark.grey, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " any variable name
    call <SID>H(
    \ {
        \ 'group': "Identifier",
        \ 'dark': {'fg': s:dark.fg, 'bg': ''},
        \ 'light': {'fg': s:light.fg, 'bg': ''},
        \ 'style': "none"
    \ })

    " function name (also: methods for classes)
    call <SID>H(
    \ {
        \ 'group': "Function",
        \ 'dark': {'fg': s:dark.blue, 'bg': ''},
        \ 'light': {'fg': s:light.blue, 'bg': ''},
        \ 'style': ""
    \ })

    " any statement
    call <SID>H(
    \ {
        \ 'group': "Statement",
        \ 'dark':  {'fg': s:dark.blue, 'bg': ''},
        \ 'light': {'fg': s:light.blue, 'bg': ''},
        \ 'style': "none"
    \ })

    " if, then, else, endif, switch, etc
    call <SID>H(
    \ {
        \ 'group': "Conditional",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.purple, 'bg': ''},
        \ 'style': ""
    \ })

    "  case, default, etc.
    call <SID>H(
    \ {
        \ 'group': "Label",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.purple, 'bg': ''},
        \ 'style': ""
    \ })

    " for, do, while, etc.
    call <SID>H(
    \ {
        \ 'group': "Repeat",
        \ 'dark': {'fg': s:dark.orange, 'bg': ''},
        \ 'light': {'fg': s:light.orange, 'bg': ''},
        \ 'style': ""
    \ })

    " any comment
    call <SID>H(
    \ {
        \ 'group': "Comment",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.grey2, 'bg': ''},
        \ 'style': ""
    \ })

    " 'sizeof', '+', '*', etc.
    call <SID>H(
    \ {
        \ 'group': "Operator",
        \ 'dark': {'fg': s:dark.cyan, 'bg': ''},
        \ 'light': {'fg': s:light.cyan, 'bg': ''},
        \ 'style': "none"
    \ })

    " any other keyword
    call <SID>H(
    \ {
        \ 'group': "Keyword",
        \ 'dark': {'fg': s:dark.fg, 'bg': ''},
        \ 'light': {'fg': s:light.fg, 'bg': ''},
        \ 'style': ""
    \ })

    " try, catch, throw
    call <SID>H(
    \ {
        \ 'group': "Exception",
        \ 'dark': {'fg': s:dark.red, 'bg': ''},
        \ 'light': {'fg': s:light.lightred, 'bg': ''},
        \ 'style': ""
    \ })

    " generic Preprocessor
    call <SID>H(
    \ {
        \ 'group': "PreProc",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " preprocessor #include
    call <SID>H(
    \ {
        \ 'group': "Include",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " preprocessor #define
    call <SID>H(
    \ {
        \ 'group': "Define",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.purple, 'bg': ''},
        \ 'style': "none"
    \ })

    " preprocessor #define
    call <SID>H(
    \ {
        \ 'group': "Macro",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.purple, 'bg': ''},
        \ 'style': "none"
    \ })

    " preprocessor #if, #else, #endif, etc
    call <SID>H(
    \ {
        \ 'group': "PreCondit",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.purple, 'bg': ''},
        \ 'style': ""
    \ })

    " int, long, char, etc.
    call <SID>H(
    \ {
        \ 'group': "Type",
        \ 'dark': {'fg': s:dark.cyan, 'bg': ''},
        \ 'light': {'fg': s:light.cyan, 'bg': ''},
        \ 'style': "none"
    \ })

    " static, register, volatile, etc.
    call <SID>H(
    \ {
        \ 'group': "StorageClass",
        \ 'dark': {'fg': s:dark.cyan, 'bg': ''},
        \ 'light': {'fg': s:light.cyan, 'bg': ''},
        \ 'style': ""
    \ })

    " struct, union, enum, etc.
    call <SID>H(
    \ {
        \ 'group': "Structure",
        \ 'dark': {'fg': s:dark.cyan, 'bg': ''},
        \ 'light': {'fg': s:light.cyan, 'bg': ''},
        \ 'style': ""
    \ })

    " a typedef
    call <SID>H(
    \ {
        \ 'group': "Typedef",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " any special symbol
    call <SID>H(
    \ {
        \ 'group': "Special",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " text that stands out, HTML links
    call <SID>H(
    \ {
        \ 'group': "Underlined",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': "underline"
    \ })


    call <SID>H(
    \ {
        \ 'group': "Title",
        \ 'dark': {'fg': s:dark.fg, 'bg': ''},
        \ 'light': {'fg': s:light.fg, 'bg': ''},
        \ 'style': "bold"
    \ })

    " any erroneous construct
    call <SID>H(
    \ {
        \ 'group': "Error",
        \ 'dark': {'fg': s:dark.red, 'bg': s:dark.bg},
        \ 'light': {'fg': s:light.red, 'bg': s:light.bg},
        \ 'style': "reverse"
    \ })

    " anything that needs extra attention; mostly the keywords TODO, FIXME, XXX
    call <SID>H(
    \ {
        \ 'group': "Todo",
        \ 'dark': {'fg': s:dark.pink, 'bg': s:dark.lighterbg1},
        \ 'light': {'fg': s:light.cyan, 'bg': s:light.grey4},
        \ 'style': ""
    \ })

    " }}}

    " Python Highlighting {{{

    call <SID>H(
    \ {
        \ 'group': "pythonFunction",
        \ 'dark': {'fg': s:dark.fg, 'bg': ''},
        \ 'light': {'fg': s:light.fg, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "pythonPreCondit",
        \ 'dark':  {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.orange, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "pythonDottedName",
        \ 'dark':  {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "pythonBuiltinObj",
        \ 'dark':  {'fg': s:dark.grey, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    " Go Highlighting {{{

    call <SID>H(
    \ {
        \ 'group': "goDirective",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "goGoroutine",
        \ 'dark': {'fg': s:dark.red, 'bg': ''},
        \ 'light': {'fg': s:light.lightred, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "goFunction",
        \ 'dark': {'fg': s:dark.fg, 'bg': ''},
        \ 'light': {'fg': s:light.fg, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "goConditionalOperator",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.purple, 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    " Vim Highlighting {{{

    call <SID>H(
    \ {
        \ 'group': "vimCommand",
        \ 'dark': {'fg': s:dark.blue, 'bg': ''},
        \ 'light': {'fg': s:light.blue, 'bg': ''},
        \ 'style': "none"
    \ })
    call <SID>H(
    \ {
        \ 'group': "vimFuncName",
        \ 'dark': {'fg': s:dark.fg, 'bg': ''},
        \ 'light': {'fg': s:light.fg, 'bg': ''},
        \ 'style': "none"
    \ })

    " }}}

    " Java Highlighting {{{

    call <SID>H(
    \ {
        \ 'group': "javaTypeDef",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaOperator",
        \ 'dark': {'fg': s:dark.red, 'bg': ''},
        \ 'light': {'fg': s:light.lightred, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaClassDecl",
        \ 'dark': {'fg': s:dark.blue, 'bg': ''},
        \ 'light': {'fg': s:light.blue, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaStorageClass",
        \ 'dark': {'fg': s:dark.blue, 'bg': ''},
        \ 'light': {'fg': s:light.blue, 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    " JavaScript Highlighting {{{

    call <SID>H(
    \ {
        \ 'group': "javaScriptBraces",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaScriptIdentifier",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.fg, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaScriptLabel",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.purple, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaScriptMember",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaScriptGlobal",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaScriptReserver",
        \ 'dark': {'fg': s:dark.blue, 'bg': ''},
        \ 'light': {'fg': s:light.blue, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaScriptNull",
        \ 'dark': {'fg': s:dark.grey, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaScriptType",
        \ 'dark': {'fg': s:dark.fg, 'bg': ''},
        \ 'light': {'fg': s:light.cyan, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "javaScriptNumber",
        \ 'dark': {'fg': s:dark.grey, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    " HTML Highlighting {{{

    call <SID>H(
    \ {
        \ 'group': "htmlTag",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "htmlEndTag",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "htmlTagName",
        \ 'dark': {'fg': s:dark.blue, 'bg': ''},
        \ 'light': {'fg': s:light.blue, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "htmlArg",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.cyan, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "htmlScriptTag",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    " XML Highlighting {{{

    call <SID>H(
    \ {
        \ 'group': "xmlTag",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "xmlEndTag",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "xmlTagName",
        \ 'dark': {'fg': s:dark.blue, 'bg': ''},
        \ 'light': {'fg': s:light.blue, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "xmlAttrib",
        \ 'dark': {'fg': s:dark.paleblue, 'bg': ''},
        \ 'light': {'fg': s:light.cyan, 'bg': ''},
        \ 'style': ""
    \ })

    " }}}

    " Markdown Highlighting {{{

    call <SID>H(
    \ {
        \ 'group': "markdownListMarker",
        \ 'dark': {'fg': s:dark.cyan, 'bg': ''},
        \ 'light': {'fg': s:light.cyan, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownCode",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownBold",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': "bold"
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownBlockquote",
        \ 'dark': {'fg': s:dark.darkerfg, 'bg': ''},
        \ 'light': {'fg': s:light.grey1, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownHeadingDelimiter",
        \ 'dark': {'fg': s:dark.lighterbg2, 'bg': ''},
        \ 'light': {'fg': s:light.grey3, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownH1",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.gold, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownH2",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.gold, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownH3",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.gold, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownH4",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.gold, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownH5",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.gold, 'bg': ''},
        \ 'style': ""
    \ })

    call <SID>H(
    \ {
        \ 'group': "markdownH6",
        \ 'dark': {'fg': s:dark.pink, 'bg': ''},
        \ 'light': {'fg': s:light.gold, 'bg': ''},
        \ 'style': ""
    \ })


    " }}}

endif

delf <SID>H


" FIXME Restore the background (needed for terminal vim)
" &bg is turned to `light` for no reason after setting the colorscheme.
" Am I missing something?
exec "set bg=" . s:curr_bg

" vim: foldmethod=marker
