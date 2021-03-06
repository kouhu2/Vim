set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim "因为windows下很多快捷键与linux下冲突，所以我禁用了win的配置文件
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
"上面是默认的关于diff的配置

colorscheme desert "设置配色方案为dersert
set autochdir "设置当前文件夹为正在编辑文件的文件夹
set ru "右下角标尺
set cursorline "高亮当前行
set nocp "非兼容模式
set is "即时搜索模式
set backspace=indent,eol,start "在插入模式下可以用backspace删除前面的字符，删除前面的换行还有前面的缩进
set whichwrap=b,s,<,>,[,] "可以从一行的左边移到上一行相关
set sw=4 "自动缩进为四个空格
set ts=4 "tab键也是四个空格
set et "把tab键变为空格
set sm "标记配对的括号
set smarttab "智能删除tab
set lbr "不在单词中间断行
set cino=:0g0t0(sus "设置c风格自动缩进
set ai "智能缩进
set wildmenu "自动补完命令时显示菜单
set fo+=mB "不在词中断行对亚洲语言支持
set wrap "一行显示不下时换行显示（不是真正的断行）
set nu "显示行数
set spell "拼写检查
""set guifont=Monaco:h10 "设置字体
filetype plugin indent on "识别文件格式的缩进
"以下是菜单隐藏设置
set guioptions-=m
set guioptions-=T
map <silent> <F3> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
"菜单隐藏设置结束F3开启
map <silent> <F2> :NERDTreeToggle <CR> "F2开启nerdtree
set nobackup "不要备份
set clipboard+=unnamed "共用系统剪贴板
"开启pathogen插件
execute pathogen#infect()
""powerline config
set t_Co=256
set laststatus=2
"以下中文乱码解决
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
set guifont=Consolas:h11
set encoding=utf-8
"以下设置默认菜单提示语言为英文
set langmenu=en_US
let $LANG='en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"自动定位我的代码位置
cd D:\CODE\Python27
