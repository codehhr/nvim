"	                              _
"	 _ __ ___  _   _   _ ____   _(_)_ __ ___  _ __ ___
"	| '_ ` _ \| | | | | '_ \ \ / / | '_ ` _ \| '__/ __|
"	| | | | | | |_| | | | | \ V /| | | | | | | | | (__
"	|_| |_| |_|\__, | |_| |_|\_/ |_|_| |_| |_|_|  \___|
"	           |___/
"	
"==========================键位====================================== 
"
" let mapleader = \ ( leader 默认就是 \ )
map s <nop>
map S :w<CR>
map Q :q!<CR>
map R :source $MYVIMRC<CR>
map <F12> [<c-i>

map J 5j
map U 5k

"向右分屏,光标在右
map sd :set splitright<CR>:vsplit<CR>

"向左分屏,光标在左
map sa :set nosplitright<CR>:vsplit<CR>

"向上分屏,光标在上
map sw :set nosplitbelow<CR>:split<CR>

"向下分屏,光标在下
map sx :set splitbelow<CR>:split<CR>

"调整分屏大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

"光标在分屏之间移动
"    su
"  sh  sk
"    sj

"up
map su <C-w>k 
"dowm
map sj <C-w>j
"let
map sh <C-w>h
"right
map sk <C-w>l

"切换分屏方向
map SH SQsd
map SV SQsx

"标签
"新建标签
map <C-t> :tabnew<CR>
"tabprevious
map sp :tabp<CR>
"tabnext
map sn :tabn<CR>

"打开文件
map e :edit<space>

"=========================vim 配色======================================= 
"语法高亮
syntax enable  
syntax on

"主题颜色设定
let g:SnazzyTransparent = 1
colorscheme snazzy

"=========================一般设置=======================================
set nocompatible					"去除VIM一致性，必须
filetype on
set scrolloff=8
set nocompatible					"vim比vi支持更多的功能，如showcmd，避免冲突和副作用，最好关闭兼容 
set encoding=utf-8					"使用utf-8编码 
set number							"显示行号 
set showcmd							"显示输入命令 
set nolist							"不显示隐藏字符
set listchars=tab:--,trail:♫		"切换显示隐藏字符 (tab & trail characters)
map zh :set list!<CR>
set clipboard=unnamed,unnamedplus	"可以从vim复制到剪贴版中 
set mouse=a							"可以在buffer的任何地方使用鼠标 
set cursorline						"高亮当前行 
set hlsearch						"显示高亮搜索 
set incsearch						"增量高亮搜索"
set smartcase						"智能大小写"
map <ESC> :nohlsearch<CR>
set history=100						"默认指令记录是20 
set ruler							"显示行号和列号（默认打开) 
set pastetoggle=<F3>				"F3快捷键于paste模式与否之间转化，防止自动缩进 
"set helplang=cn					"设置为中文帮助文档,需下载并配置之后才生效 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  "打开上次编辑位置"

"===========================文本格式排版================================
set tabstop=4						"设置tab长度为4 
set softtabstop=4
set shiftwidth=4					"设置自动对齐的缩进级别 
set cindent							"自动缩进,以c语言风格，例如从if进入下一行，会自动缩进shiftwidth大小 
set smartindent						"改进版的cindent,自动识别以#开头的注释，不进行换行 
set autoindent						"autoindent配合下面一条命令根据不同语言类型进行不同的缩进操作，更加智能 
filetype plugin indent on 
set nowrap 

"======================NerdTree插件的配置信息===============================
"将F2设置为开关NERDTree的快捷键
map <C-\> :NERDTreeToggle<cr>
"修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"窗口位置
let g:NERDTreeWinPos='left'
"窗口尺寸
let g:NERDTreeSize=30
"窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
"不显示隐藏文件
let g:NERDTreeHidden=0

"======================================= coc 代码补全 =============================
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ====================================== coc translate===========================
" NOTE: do NOT use `nore` mappings
" popup
nmap tr <Plug>(coc-translator-p)
vmap tr <Plug>(coc-translator-pv)
" echo
nmap te <Plug>(coc-translator-e)
vmap te <Plug>(coc-translator-ev)
" replace
nmap TR <Plug>(coc-translator-r)
vmap TR <Plug>(coc-translator-rv)


"======================================nerdcommenter注释工具==========================
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"==================== tagbar 展示当前文件的一些函数,按下回车跳转到指定的函数=======
let g:tagbar_width=30
" 将tagbar的开关按键设置为 <F11>
nnoremap <silent> <F11> :TagbarToggle<CR> 


"==================================indentLine=======================================
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"=======================markdown-preview===========================================
"默认配置
let g:mkdp_path_to_chrome = "google-chrome-stable"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
" 如果设置了该参数, g:mkdp_browserfunc 将被忽略

let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" vim 回调函数, 参数为要打开的 url

let g:mkdp_auto_start = 0
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次

let g:mkdp_auto_open = 0
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" 览窗口

let g:mkdp_auto_close = 1
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口

let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" 更新预览

let g:mkdp_command_for_global = 0
" 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
" 文件可以使用改命令

let g:mkdp_open_to_the_world = 0
" 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
" 默认只监听本地（127.0.0.1），其他计算机不能访问

" 键位绑定:

" 普通模式
nmap <silent> <F8> <Plug>MarkdownPreview   

" 插入模式
imap <silent> <F8> <Plug>MarkdownPreview    

"普通模式
nmap <silent> <F9> <Plug>StopMarkdownPreview   

"插入模式
imap <silent> <F9> <Plug>StopMarkdownPreview 

"缩进采用的是两个空格=================vim-vue====================================
au BufNewFile,BufRead *.html,*.js,*.vue set tabstop=2

au BufNewFile,BufRead *.html,*.js,*.vue set softtabstop=2

au BufNewFile,BufRead *.html,*.js,*.vue set shiftwidth=2

au BufNewFile,BufRead *.html,*.js,*.vue set expandtab

au BufNewFile,BufRead *.html,*.js,*.vue set autoindent

au BufNewFile,BufRead *.html,*.js,*.vue set fileformat=unix

"=====================vim-emmet==============================================
let g:user_emmet_expandabbr_key = '<C-e>'

"========================vim-airline======================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"=================================vim-plug========================================

call plug#begin('~/.config/nvim/plugged')

"nerdtree 左侧打开文件目录
Plug 'preservim/nerdtree'

"css/less/sass/html color preview for vim
Plug 'gorodinskiy/vim-coloresque'

"Syntax Highlighting for Stylus
Plug 'wavded/vim-stylus'

"Vastly improved Javascript indentation and syntax support in Vim.
Plug 'pangloss/vim-javascript'

"coc.vim 补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"注释工具
Plug 'scrooloose/nerdcommenter'

"提供嵌套括号高亮
Plug 'luochen1990/rainbow'

"展示当前文件的函数
Plug 'majutsushi/tagbar'

"highlight for c++
Plug 'octol/vim-cpp-enhanced-highlight'

"indentLine
Plug 'Yggdroot/indentLine'

"实时通过浏览器预览 markdown 文件
Plug 'iamcco/markdown-preview.vim'

"如果需要预览数学公式，还需要安装 mathjax-support-for-mkdp 插件
Plug 'iamcco/mathjax-support-for-mkdp'

"vue 语法高亮
Plug 'posva/vim-vue'

" html补全
Plug 'mattn/emmet-vim'

" vim 多光标
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" 主题颜色
Plug 'connorholyday/vim-snazzy'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()

