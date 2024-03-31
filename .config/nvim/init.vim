""                          "" 
""   START NEOVIM CONFIG:   ""   
""                          ""

" SHORTCUT SETTINGS: 
" Set mapleader
let mapleader=","
" Space to command mode.
nnoremap <space> :
vnoremap <space> :
" Switching between buffers.
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


"
" GENERAL SETTINGS:  --------------------------------------------------
"
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
set ignorecase
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
""set statusline=%F%m%r%h%w%=\ %l,%v\ \ \ \ %p%%\ \ \ \ [%L]


"===
"=== 插件设置  -----------------------------------------------------------
"===
set rtp+=~/.config/nvim/autoload/plug.vim

call plug#begin('~/.config/nvim/plugged/')
Plug 'morhetz/gruvbox'                   "主题
Plug 'jiangmiao/auto-pairs'              "自动括号补齐
Plug 'octol/vim-cpp-enhanced-highlight'  "C++高亮补充
Plug 'neoclide/coc.nvim', {'branch': 'release'}  

Plug 'tpope/vim-fugitive'   "vim 内部git命令
Plug 'honza/vim-snippets'                
Plug 'dimasg/vim-mark'

Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'                
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()


""主题设置""
set background=dark
let g:_termcolors=256
colorscheme gruvbox


"===
"=== indentLine -----------------------------------------------------------
"=== 
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


"===
"=== NERDTree.vim  ------------------------------------------------------------------------------------
"===
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

let g:NERDTreeWinPos="right"
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1

" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 30 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
"autocmd vimenter * if !argc()|NERDTree|endif
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
"=== TagBar ------------------------------------------------------------------------------------
"===

"autocmd FileType c,cpp set shiftwidth=4 | call tagbar#autoopen()
nmap <silent> <leader>t :TagbarToggle<CR>

let g:tagbar_width=30
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
"=== Coc ------------------------------------------------------------------------------------
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
            \ 'coc-python',
            \ 'coc-syntax']

nmap <silent> <leader>a :CocCommand clangd.switchSourceHeader<CR>

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
"xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
"nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"######## coc-git mapping ########
"navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)


"######## coc-snippets mapping ########
" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
"xmap <leader>x  <Plug>(coc-convert-snippet)





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


"for show no user whitespace
"Bundle 'bronson/vim-trailing-whitespace'
"map <leader><space> : FixWhitespace<cr>



"===
"=== vim-fzf  -----------------------------------------------------------
"===
"noremap <leader>f :FZF<ENTER>
set rtp+=~/.fzf/

"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  } let g:fzf_layout = { 'down': '30%'  }
"autocmd! FileType fzf
"autocmd  FileType fzf set laststatus=0 noshowmode noruler
"  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Terminal colors for seoul256 color scheme
if has('nvim')
 let g:terminal_color_0 = '#4e4e4e'
 let g:terminal_color_1 = '#d68787'
 let g:terminal_color_2 = '#5f865f'
 let g:terminal_color_3 = '#d8af5f'
 let g:terminal_color_4 = '#85add4'
 let g:terminal_color_5 = '#d7afaf'
 let g:terminal_color_6 = '#87afaf'
 let g:terminal_color_7 = '#d0d0d0'
 let g:terminal_color_8 = '#626262'
 let g:terminal_color_9 = '#d75f87'
 let g:terminal_color_10 = '#87af87'
 let g:terminal_color_11 = '#ffd787'
 let g:terminal_color_12 = '#add4fb'
 let g:terminal_color_13 = '#ffafaf'
 let g:terminal_color_14 = '#87d7d7'
 let g:terminal_color_15 = '#e4e4e4'
else
 let g:terminal_ansi_colors = [
    \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
    \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
    \ '#626262', '#d75f87', '#87af87', '#ffd787',
    \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4'
    \ ]
endif






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
"生成索引文件列表  find /home/path/ -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files  
"生成索引文件 cscope -bkq -f ~/project/cscope.out -i cscope.files   
"2、在.bashrc中加入绝对路径
"		CSCOPE_DB=/project/cscope.out
"		export CSCOPE_DB

" ==== ctags =====
set autochdir
set tag=tags;
"find . -name "*.h" -o -name "*.c" -o -name "*.cpp" >> files
"ctags -L files
"
"ctags -R --fields=+niazSK --extra=+qf --c++-kinds=+px --c-kinds=+px



"===
"=== 杂项 -----------------------------------------------------------
"===

" Man.vim
source $VIMRUNTIME/ftplugin/man.vim



"===
"=== plugin shortcuts 快捷键 -------------------------------------------------
"===
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction
nmap w :w!<ENTER>
"nmap W :w!<ENTER>
nmap q :q<ENTER>
"nmap Q :q<ENTER>
"nmap WQ :x<ENTER>
nmap s %
nmap f ^
"nmap f 0
nmap . $
"gd
"nmap e #
nmap ; *
":noh
nmap ' :noh<ENTER>
noremap  <leader>= :set mouse =<ENTER>
"noremap  <leader>n :set mouse =n<ENTER>
noremap <leader>o :vs










