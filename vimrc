set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
let eq = ''
    if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
let cmd = '""' . $VIMRUNTIME . '\diff"'
let eq = '"'
else
let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
endif
else
    let cmd = $VIMRUNTIME . '\diff'
endif
silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

colorscheme desert
set autochdir
set ru
set cursorline
set nocp
set is
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set sw=4
set ts=4
set et
set sm
set smarttab
set lbr
set cino=:0g0t0(sus
set ai
set wildmenu
set fo+=mB
set wrap
set cindent shiftwidth=4
set smartindent
set nu
set spell
""set guifont=Monaco:h10
filetype plugin indent on
"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F3> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
map <silent> <F2> :NERDTreeToggle <CR>
set nobackup
set clipboard+=unnamed
execute pathogen#infect()
""powerline config
set t_Co=256
set laststatus=2
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
"language messages zh_CN.utf-8
set guifont=Consolas:h11
set encoding=utf-8
set langmenu=en_US
let $LANG='en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
cd D:\CODE\Python27
