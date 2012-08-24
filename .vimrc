"current dir for working dir
set autochdir
filetype plugin indent off
"pathogen,vim addons manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
"powerline
let g:Powerline_symbols = 'fancy'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
"设置行号
set nu
"选择配色
colo evening
" set mouse
if has("gui_gtk2")
	"set guifont=Bitstream\ Vera\ Sans\ Mono\ 12,Fixed\ 12
	set guifont=Courier\ 12
        set guifont=Youyuan\ 12,DejaVu\ Sans\ for\ rowerline\ 12
	set guifontwide=Microsoft\ Yahei\ 12,WenQuanYi\ Zen\ Hei\ 12,DejaVu\ Sans\ 12
endif
"换行
"set textwidth=78
"显示命令
set showcmd
"使在可视模式时可以用p粘帖替换
"vnoremap _g y:exe "grep /" . escape(@", '\\/') . "/ *.c *.h"<CR>

"在终端支持和gui界面使用语法高亮和搜索高亮
if &t_Co > 2 || has("gui_running")
syntax on
set hlsearch
endif

"全局行宽
"set textwidth=24
"在文件类型为tex时指定行宽
autocmd FileType tex setlocal textwidth=78
"这是另一个自动命令. 这次它服务的对象是所有类型的文件. 它所
"执行的复杂功能是检查是否定义了标记`" , 如果定义了就跳转到这个位
"置
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g‘\"" |
\ endif

"将自动备份文件扩展名改为.bak而非默认的~
set backupext=.bak
"保存原始版本并指定扩展名
"set patchmode=.orig

"鼠标使用微软习惯，支持右键菜单
behave mswin

"让shift缩进两个字符
set shiftwidth=2

"支持中文
"set encoding=UTF-8
set fileencodings=UTF-8,cp936,GB2312,GBK,GB18030
"set termencoding=UTF-8
"set fileformats=unix,dos 

"插件fencview
"let g:fencview_autodetect=1 "不知道为什么没用


"=========================================================

"vim-latex插件手册要求配置
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"打开文件类型识别，插件识别
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"生成pdf而非dvi
let g:Tex_DefaultTargetFormat = 'pdf'
"使用xelatex编译，参数保证正反向搜索
let g:Tex_CompileRule_pdf = 'xelatex -src-specials -synctex=1 -interaction=nonstopmode $*'
"设置反向搜索
let g:Tex_ViewRule_pdf = 'okular'
let g:Tex_UseEditorSettingInDVIViewer = 1
"useful?
let g:Tex_UseMakefile = 0

"===================================
"防止vimwiki与supertab、snipmate的tab键冲突
"let g:vimwiki_table_auto_fmt = 0
"supertab与snipmate的tab键冲突解决方案
"let SuperTabMappingForward="<tab>"
let SuperTabMappingBackward="<s-tab>"
"wiki鼠标支持
"let g:vimwiki_use_mouse = 1
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"          \ 'template_path': '~/vimwiki/template/',
"          \ 'template_default': 'template',
"          \ 'template_ext': '.html'}]
"使html标签生效
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h4,h5,h6,pre'
"为syntaxhighligter语法高亮加的
"  let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'perl': 'perl'}
" 不要将驼峰式词组作为 Wiki 词条
"let g:vimwiki_camel_case = 0
"在vimwiki中使用calendar
"let g:vimwiki_use_calendar = 1
"insert模式<F2>加入时间戳
imap <F2> <C-R>=strftime("%c")<CR>

if has("gui_running")
    "au GUIEnter * simalt ~x " 窗口启动时自动最大化{这个没有用啊}
    "set guioptions-=m       " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
    "set guioptions-=L       " 隐藏左侧滚动条
    "set guioptions-=r       " 隐藏右侧滚动条
    "set guioptions-=b       " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
endif

"状态行显示的内容 [包括系统平台、文件类型、坐标、所占比例、时间等]
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %y%r%m%*%=\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" ######### 括号、引号、中括号等自动匹配 ######### "
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
":inoremap ` ``<ESC>i
function ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf
"========================================
"vimim云
let g:vimim_map='c-bslash'
"========================================
"slimv
"let g:slimv_python = 'python2'
let g:slimv_preferred = 'clisp'
let g:slimv_clhs_root = "file:///home/lyy/Documents/HyperSpec/Body/"
"let g:slimv_repl_split = 4 "水平分割
"==================================
"python
let g:pymode_rope_guess_project = 0
let g:pymode_folding = 0

"========================
"c.vim
let g:C_LoadMenus = 'no'


