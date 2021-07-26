autocmd BufWritePost $MYVIMRC source $MYVIMRC "让vimrc配置变更立即生效'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""插件配置""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"配置plugins

set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须
 
"n 'Valloric/YouCompleteMe'设置包括 vundle 和初始化相关的 run time path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
"Plugin 'tenfyzhong/CompleteParameter.vim'

Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-airline/vim-airline' "状态栏美化


call vundle#end()            " 必须
filetype plugin indent on    " 必须加载vim自带和插件相应的语法和文件类型相关脚本
  
"忽视插件改变缩进,可以使用以下替代:
"filetype plugin on

 
 
"YCM配置

set runtimepath+=~/.vim/bundle/YouCompleteMe
"let g:ycm_global_ycm_extra_conf= '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py' "寻找全局配置文件
"let g:ycm_global_ycm_extra_conf= '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py' "寻找全局配置文件
let g:ycm_global_ycm_extra_conf= '~/.ycm_extra_conf.py' "寻找全局配置文件
let g:ycm_server_python_interpreter='/usr/bin/python3.8'    "python版本在3以上
"let g:ycm_clangd_binary_path = "~/ycm_temp/llvm_root_dir/bin/clangd"
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang.so'  "libclang路径


"let g:syntastic_ignore_files=[".*\.py$"] "忽略所有的.py文件
let g:ycm_collect_identifiers_from_tags_files=1 "开启 YCM 标签补全引擎,使用ctags生成的tags文件
"let g:ycm_auto_trigger=1
"let g:ycm_show_diagnostics_ui=0  "禁用语法检查
"let g:ycm_disable_signature_help=1 "禁用签名帮助
let g:ycm_seed_identifiers_with_syntax = 1 " 语法关键字补全
"let g:disable_protodef_sorting=1 "成员函数的实现顺序与声明顺序一致
"
"set completeopt=popup " 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt=menu " 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt=popup " 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt=longest,menu "让补全行为与一般的IDE一致
let g:ycm_add_preview_to_completeopt =1 "为当前补全选项在vim顶部增加预览窗口，用来显示函数原型等信息
"let g:ycm_autoclose_preview_window_after_insertion = 1 "离开插入模式后自动关闭预览窗口
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif     " 离开插入模式后自动关闭预览窗口"
"let g:ycm_max_num_candidates_to_detail=0
"
let g:ycm_collect_identifiers_from_comments_and_strings=1 " 注释与字符串中的内容也用于补全
let g:ycm_complete_in_comments=1 " 补全功能在注释中同样有效
let g:ycm_complete_in_strings=1 " 补全功能在字符串中同样有效
let g:ycm_collect_identifiers_from_comments_and_strings=1 "注释和字符串中的文字也会被收入补全
"let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_confirm_extra_conf=0 "允许 vim 加载 .ycm_extra_conf.py 文件，每次打开vim时不再提示
"let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 1
let g:ycm_min_num_of_chars_for_completion=1 " 从第2个键入字符就开始罗列匹配项
let g:ycm_max_num_identifier_candidates = 10 "标识符匹配候选数量
let g:ycm_max_num_candidates = 10 "语义补全列表数量

"YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
"映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>'] 
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"let g:ycm_key_invoke_completion = '<c-z>'

map <F2> :YcmCompleter GoToDefinition<CR>
map <F3> :YcmCompleter GoToDeclaration<CR>
map <F4> :YcmCompleter GoToDefinitionElseDeclaration<CR>

"let g:ycm_key_list_select_completion = ['', '']  " 映射按键,
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"  "回车即选中当前项
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|  "跳转到定义处
let g:ycm_goto_buffer_command = 'horizontal-split' " 跳转打开上下分屏

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }


" 菜单颜色\布局
"highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900



"tagbar配置
let g:tagbar_ctags_bin = 'ctags' " tagbar 依赖 ctags 插件
let g:tagbar_width     = 30      " 设置 tagbar 的宽度为 30 列，默认 40 列
let g:tagbar_higth     = 30
let g:tagbar_autofocus = 1       " 打开 tagbar 时光标在 tagbar 页面内，默认在 vim 打开的文件内
let g:tagbar_left      = 1       " 让 tagbar 在页面左侧显示，默认右边
let g:tagbar_sort      = 0       " 标签不排序，默认排序
 
 " <leader>tb 打开 tagbar 窗口，在左侧栏显示
nmap <silent>tb :TagbarToggle<CR>



"ctags配置
set tags=tags;
set autochdir



"taglist配置
let Tlist_Show_One_File           = 1    " 只显示当前文件的tags
let Tlist_GainFocus_On_ToggleOpen = 1    " 打开 Tlist 窗口时，光标跳到 Tlist 窗口
let Tlist_Exit_OnlyWindow         = 1    " 如果 Tlist 窗口是最后一个窗口则退出 Vim
let Tlist_Use_Left_Window         = 1    " 在左侧窗口中显示
let Tlist_File_Fold_Auto_Close    = 0    " 自动折叠
let Tlist_Auto_Update             = 1    " 自动更新
 
" <leader>tl 打开 Tlist 窗口，在左侧栏显示
nmap <silent>tl :TlistToggle<Cr>

"nerdtree配置
let NERDTreeHighlightCursorline = 1       " 高亮当前行
let NERDTreeShowLineNumbers     = 1       " 显示行号
" 忽略列表中的文件
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$','^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
" 启动 vim 时打开 NERDTree
"autocmd vimenter * NERDTree
" 当打开 VIM，没有指定文件时和打开一个目录时，打开 NERDTree
"autocmd StdinReadPre * let s:std_in = 1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
"!exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd'.argv()[0] | endif
"" 关闭 NERDTree，当没有文件打开的时候
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | end
" <leader>nt 打开 nerdtree 窗口，在左侧栏显示
nmap <silent>nt :NERDTreeToggle<CR>
"<leader>tc 关闭当前的 tab
nmap <silent>tc :tabc<CR>
" <leader>to 关闭所有其他的 tab
nmap <silent>to :tabo<CR>
"<silent>ts "查看所有打开的 tab
nmap <silent>ts :tabs<CR>
"<leader>tp "前一个 tab
nmap <silent>tp :tabp<CR>
"nmap <leader>tn :tabn<CR> "后一个 tab

let g:solarized_termtrans  = 1        " 使用 termnal 背景
"let g:solarized_visibility = "high"   " 使用 :set list显示特殊字符时的高亮级别

"" GUI 模式浅色背景，终端模式深色背景
if has('gui_running')
	set background=light
else
	set background=dark
endif

" 主题设置为 solarized
colorscheme solarized




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""基本设置""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix "修改文件的换行格式

"set showcmd "显示命令

"设置代码折叠
"set fdm=indent

set nu "设置行号

set t_Co=256 " 支持256色，使得vim配色支持终端

set cindent "设置c风格缩进"

set autoindent "设置自动缩进  set smartindent 开启新行时使用智能自动缩进

set autoindent "继承前一行的缩进方式，适用于多行注释

set cursorline "设置当前行突出显示"

set tabstop=4 "设置Tab长度为4空格

set shiftwidth=4 "设置自动缩进长度为4空格

set laststatus=2 "总是显示状态栏
"我的状态行显示的内容（包括文件类型和解码）  
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]  

set ruler "显示光标当前位置

set incsearch " 输入搜索内容时就显示搜索结果

set hlsearch " 搜索时高亮显示被找到的文本
set incsearch "搜索逐字符高亮  

syntax on "自动语法高亮

"set noeb " 去掉输入错误的提示声音  
set vb t_vb= "去掉错误提示音

"禁止生成临时文件  
"set nobackup  
"set noswapfile  

"括号匹配"
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

"set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
"set matchtime=2 " 短暂跳转到匹配括号的时间
