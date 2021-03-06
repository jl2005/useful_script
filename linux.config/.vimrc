set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'cespare/vim-golang'
Bundle 'dgryski/vim-godef'
Bundle 'Blackrush/vim-gocode'
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" My bundles here:
"
" original repos on GitHub

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


filetype plugin indent on

syntax on

"set paste
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
" set cindent
set nu
set ruler		" show the cursor position all the time
set smarttab

"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='TagList'
"nmap wm :WMToggle<cr>
let g:winManagerWidth = 40
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim

"nnoremap <silent> <F4> :A<CR>
map <F3> za
"nnoremap <silent> <F5> :LookupFile<CR>
nnoremap <silent> <F6> :IH<CR>
nnoremap <silent> <F7> :make<CR>
nnoremap <silent> <F8> :NERDTree<CR>
nnoremap <silent> <F9> :TlistToggle<CR>
nnoremap <silent> <F5> :WMToggle<CR>
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 

nnoremap <silent> <F3> <ESC><C-W>x 

let @f=":set ro:%s/{/{\\r/g:set filetype=javascript==gg=G"

nmap <F12> :cn<CR>

"set tags=./tags,../tags,../../tags,../../../tags,/usr/include/tags,/usr/local/include/tags,/search/xml_pa_dep/tags
set tags=/usr/include/tags,/usr/include/c++/tags,./tags,/usr/local/include/tags,/usr/local/lib/ruby/gems/1.9.1/gems/tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags,./../../../../../../../tags

hi PmenuSel ctermfg=0 ctermbg=4 

set makeprg=make\ DEBUG=y\ -j6
"set encoding=utf-8 fileencodings=utf-8,gbk,ucs-bom,cp936,big5,euc-jp,euc-kr,latin1 termencoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936,big5,euc-jp,euc-kr,latin1

let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
set completeopt=longest,menu
"inoremap <expr><CR> pumvisible()?"\<C-Y>":"\<CR>"
inoremap <C-]>  <C-X><C-]>
inoremap <C-F>  <C-X><C-F>
inoremap <C-D>  <C-X><C-D>
inoremap <C-L>  <C-X><C-L>


set cscopequickfix=s-,c-,d-,i-,t-,e-  

"""""""""""""""""""""""""""""""
"" lookupfile setting
"""""""""""""""""""""""""""""""
"let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
"let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
"let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
"let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
"let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"if filereadable("./filenametags")                "设置tag文件的名字
"let g:LookupFile_TagExpr = '"./filenametags"'
"endif
""映射LookupFile为,lk
"nmap <silent> <leader>lk :LUTags<cr>
""映射LUBufs为,ll
"nmap <silent> <leader>ll :LUBufs<cr>
""映射LUWalk为,lw
"nmap <silent> <leader>lw :LUWalk<cr>

" command-t
set wildignore+=*.o,*.obj,.gi,*.pyc,.vim,*.lo,*.la,*.so.*,_lib,_bin,_aux,*.cache,doxygen
"let g:CommandTBackspaceMap = "<del>"
"let g:CommandTDeleteMap = "<BS>"

set modeline
" Highlight search results
set hlsearch
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Makes search act like search in modern browsers
set incsearch
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
"set stal=2  "总是显示文件名，但这个文件名是在顶端显示的
set laststatus=2  "总是显示状态栏
"set cinoptions=:0,l1,g0
"鼠标所在行的下划线
set cursorline

highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

let g:rsenseHome = $RSENSE_HOME
let g:rsenseUseOmniFunc = 1

map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

let g:tlTokenList = ["FIXME", "TODO", "XXX", "CHECKME", "FIXED", "CHECKED"]

au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim
