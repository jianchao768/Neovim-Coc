"set tags=/home/ts/workspace/code/sm7250/vendor/qcom/proprietary/tags 
"set tags=/home/ts/workspace/code/sm7250/tags
"set tags=/home/ts/workspace/code/oneplus/android/vendor/qcom/proprietary/tags  "oneplus"
set tags=/home/ts/workspace/code/sm8350/android/vendor/qcom/proprietary/tags 


" SHORTCUT SETTINGS: 
" Set mapleader
let mapleader=","
" Space to command mode.
nnoremap <space> :
vnoremap <space> :
" Switching between buffers.
" ??
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l
" "cd" to change to open directory.
let OpenDir=system("pwd")
nmap <silent> <leader>cdr :exe 'cd ' . OpenDir<cr>:pwd<cr>
nmap <silent> <leader>cdf :cd %:h<cr>:pwd<cr>


" AUTO COMMANDS: 
" auto expand tab to blanks
autocmd FileType c,cpp set expandtab
" Restore the last quit position when open file.
" automaticly return last quit positon 
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif



" GENERAL SETTINGS: 
set nocompatible
filetype plugin indent on
syntax on
set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set nobackup
set cindent
set cinoptions=:0
set completeopt=longest,menuone
set cursorline
set encoding=utf-8
set noexpandtab
"set expandtab
set fileencodings=utf-8,gb2312,gbk,gb18030,chinese
set fileformat=unix
set foldenable
set foldmethod=marker
set helpheight=10
set helplang=cn
set hidden
set history=100
set hlsearch
"set   ignorecase "忽略大小写,加了这行之后vi -t会卡屏"
set incsearch
set laststatus=2
"You can copy context if use v
set mouse=a
set number
set pumheight=10
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set smartindent
set smartcase
set tabstop=4
set termencoding=utf-8
set textwidth=280
set whichwrap=h,l
set wildignore=*.bak,*.o,*.e,*~
set wildmenu
set wildmode=list:longest,full
set nowrap
set updatetime=100
set colorcolumn=+1

" 设置状态行显示常用信息    
" " %F 完整文件路径名    
" " %m 当前缓冲被修改标记    
" " %m 当前缓冲只读标记    
" " %h 帮助缓冲标记    
" " %w 预览缓冲标记    
" " %Y 文件类型    
" " %b ASCII值    
" " %B 十六进制值    
" " %l 行数    
" " %v 列数    
" " %p 当前行数占总行数的的百分比    
" " %L 总行数    
" " %{...} 评估表达式的值，并用值代替    
" " %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码    
" " %{&ff} 显示文件类型    
" " \ \代表加入一个空格                                                                                                                                                                                                                                                                                                    
set statusline=%F%m%r%h%w%=\ %l,%v\ \ \ \ %p%%\ \ \ \ [%L]

"set tag=tags;


"===
"=== 插件设置  -----------------------------------------------------------
"===
set rtp+=~/.config/autoload/plug.vim

call plug#begin('~/.config/plugged/')
Plug 'jiangmiao/auto-pairs'              "自动括号补齐
Plug 'octol/vim-cpp-enhanced-highlight'  "C++高亮补充
"Plug 'airblade/vim-gitgutter'            "git检测文件改动
"Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'                   "主题
Plug 'preservim/nerdtree'                
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'honza/vim-snippets'                "C++ 
Plug 'neoclide/coc.nvim', {'branch': 'release'}  
Plug 'dimasg/vim-mark'
call plug#end()


""主题设置""
set background=dark
let g:_termcolors=256
colorscheme gruvbox



"===
"=== coc.vim  -----------------------------------------------------------
"===
let g:coc_global_extensions = [
            \ 'coc-flutter-tools',
            \ 'coc-json',
            \ 'coc-cmake',
            \ 'coc-emmet',
            \ 'coc-highlight',
            \ 'coc-vimlsp',
            \ 'coc-lists',
            \ 'coc-clangd',
            \ 'coc-flutter',
            \ 'coc-floatinput',
            \ 'coc-git',
            \ 'coc-yank',
            \ 'coc-tabnine',
            \ 'coc-actions',
            \ 'coc-syntax']

nmap <silent> <leader>a :CocCommand clangd.switchSourceHeader<CR>

" 使用 <tab> 触发补全: >
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 使用 <CR> 确认补全，并触发 coc.nvim 的 `formatOnType` 功能: >
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
  else
    call CocAction('doHover')
  endif
endfunction
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

" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

augroup mygroup
    autocmd!
    " Update signature help on jump placeholder.
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Apply AutoFix to problem on the current line.
nmap <leader>ff  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

"coc-git
"navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
"nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)






"===
"=== NERDTree.vim -----------------------------------------------------------
"===
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

let g:NERDTreeWinPos="right"
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1

" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <F3> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键


"===
"=== tagbar     -------------------------------------------------------------
"===
nmap <silent> <leader>t :TagbarToggle<CR>

let g:tagbar_width=20
let g:tagbar_autofocus = 1
let g:tagbar_sort = 1
let g:tagbar_autoshowtag = 0
let g:tagbar_left = 1
let g:tagbar_scopestrs = {
            \    'class': "\uf0e8",
            \    'const': "\uf8ff",
            \    'constant': "\uf8ff",
            \    'enum': "\uf702",
            \    'field': "\uf30b",
            \    'func': "\uf794",
            \    'function': "\uf794",
            \    'getter': "\ufab6",
            \    'implementation': "\uf776",
            \    'interface': "\uf7fe",
            \    'map': "\ufb44",
            \    'member': "\uf02b",
            \    'method': "\uf6a6",
            \    'setter': "\uf7a9",
            \    'variable': "\uf71b",
            \ }

"===
"=== cscope.vim -------------------------------------------------------------
"===
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

"=== cscope快捷键设置 -------

nmap  <F6> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>
nmap  <F9> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
nmap <F10> :call HLUDSync()<cr>
nmap <F11> :call RunShell("Generate filename tags", "~/.vim/shell/genfiletags.sh")<cr>
nmap <F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>
nmap <leader>sa :cs add cscope.out<cr>

	"查找指定标识符的使用位置
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
	"查找指定标识符定义的位置
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
"查找那些函数调用了此函数
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
	"查找指定的文本字符串，较慢
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
	"查找指定的正则表达式，此时不宜用键盘映射
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
"查找指定的文件
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
"查找指定文件被那些文件包含
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
"查找此函数调用了哪些函数
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>

nmap <leader>zz <C-w>o
nmap <leader>gs :GetScripts<cr>

"cscope使用方法：
"1、需要用绝对路径，否则会找不到文件
"生成索引文件列表  find /home/ts/workspace/code/sm7250/ -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files  
"生成索引文件 cscope -bkq -f ~/project/cscope.out -i cscope.files   
"2、在.bashrc中加入绝对路径
"		CSCOPE_DB=/project/cscope.out
"		export CSCOPE_DB



"===
"=== gitgutter -----------------------------------------------------------
"===
"开启会降低启动速度
let GitGutterDisable=1
let GitGutterSignsDisable=1
let g:gitgutter_max_signs=500

let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='#'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_removed_first_line='^^'
let g:gitgutter_sign_removed_above_and_below='{'
let g:gitgutter_sign_modified_removed='~'



" OmniCppComplete.vim
let g:OmniCpp_DefaultNamespaces=["std"]
let g:OmniCpp_MayCompleteScope=1
let g:OmniCpp_SelectFirstItem=2

" VimGDB.vim
if has("gdb")
	set asm=0
	let g:vimgdb_debug_file=""
	run macros/gdb_mappings.vim
endif

" LookupFile setting
let g:LookupFile_TagExpr='"tags.fn"'
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0

" Man.vim
source $VIMRUNTIME/ftplugin/man.vim

" snipMate
let g:snips_author="Ning Wei,wuyh"
let g:snips_email="Ningwei@163.com,wuyh0623@thundersoft"
let g:snips_copyright="SicMicro, Inc"

let g:indentLine_char='|'


"===
"=== plugin shortcuts 快捷键 -------------------------------------------------
"===
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction
nmap w :w!<ENTER>
nmap W :w!<ENTER>
nmap q :q!<ENTER>
nmap Q :q!<ENTER>
nmap WQ :x<ENTER>
nmap s %
nmap f ^
"nmap f 0
nmap . $
"gd
nmap e #
nmap ; *
":noh
nmap ' :noh<ENTER>
noremap  <leader>= :set mouse =<ENTER>
"noremap  <leader>n :set mouse =n<ENTER>
noremap <leader>o :vs

"nmap Z :x<ENTER>
nmap  <F2> :TlistToggle<cr>
nmap  <F3> :NERDTreeToggle<cr>
nmap  <F4> :MRU<cr>
"nmap  <F5> <Plug>LookupFile<cr>
"F5编译运行
map  <F5> :call CompileeRunGcc()<CR>
func! CompileeRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype =='java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
		exec "!time go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!filefox %.html &"
		endif 
endfunc 
"调试
map <F8> : call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ %-g -o %<"
	exec "!gdb ./%<"
endfunc
"---



"===
"=== Auto-Pairs ---------------------------------------------------
"===
let g:AutoPairShortcutToggle = '<leader>a'
"let g:AutoPairShortcutFastWrap
"let g:AutoPairShortcutJump
"let g:AutoPairShortcutBackInsert

let g:winManagerWindowLayout='FileExplorer|BufExplorer' 
let g:persistentBehaviour=0         
let g:winManagerWidth=20
let g:defaultExplorer=1
nmap <silent> <leader>fir :FirstExplorerWindow<cr>
nmap <silent> <leader>bot :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>
"use Ctrl+c to copy context
"vmap <C-c> "+y

"modify ctags' shortcuts 
"noremap ]  <C-]>
"noremap t  <C-t>

"This tip provides the same autoloading functionality for Cscope
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au BufEnter /* call LoadCscope()
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)
"for show no user whitespace
"Bundle 'bronson/vim-trailing-whitespace'
"map <leader><space> : FixWhitespace<cr>

