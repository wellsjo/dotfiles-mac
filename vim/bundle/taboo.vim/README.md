## taboo.vim

Taboo is a simple plugin that ease renaming vim tabs and customizing
their appearance.

### Requirements

* Vim 7.2+

### Installation

You can either extract the content of the folder into the `$HOME/.vim`
directory or use a plugin manager such as [Vundle](https://github.com/gmarik/vundle),
[Pathogen](https://github.com/tpope/vim-pathogen) or [Neobundle](https://github.com/Shougo/neobundle.vim).

**NOTE**: tabs look different in terminal vim than in gui versions. If you wish
having terminal style tabs even in gui versions you have to add the following
line to your .vimrc file
```vim
set guioptions-=e
```

Taboo is able to remeber custom tab labels when you save the current session
but you are required to set the following option in your .vimrc file
```vim
set sessionoptions+=tabpages,globals
```

### Commands

**TabooRename {name}** Renames the current tab with the name provided.

**TabooOpen {name}** Opens a new tab and and gives it the name provided.

**TabooReset** Removes the custom label associated with the current tab.

### Basic options

**g:taboo\_tab\_format**

With this option you can customize the way normal tabs (not renamed tabs) look
like. Below all the available items:

- `%f`: file name
- `%F`: path relative to `$HOME`
- `%a`: absolute path
- `%[n]a` : custom level of path depth (e.g. `%2a`)
- `%n`: tab number only on the active tab
- `%N`: tab number on each tab
- `%m`: modified flag
- `%w`: number of windows opened into the tab

Default: `%f%m`

**g:taboo\_renamed\_tab\_format**

Same as `g:taboo_tab_format` but for renamed tabs.  In a renamed tab, the items
`%f`, `%F`, `%a` and `%[n]a` will be evaluated to the custom label associated to
the tab.

Default: `[%f]%m`

**g:taboo\_modified\_tab\_flag**

This option controls how the modified flag looks like.

Default: `*`
