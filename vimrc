set nocompatible          " We're running Vim, not Vi!
filetype off

" Vundling
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle' 

Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jcf/vim-latex'
Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'phleet/vim-mercenary'
" Plugin 'slim-template/vim-slim'
Plugin 'skalnik/vim-vroom'
Plugin 'mattn/emmet-vim'
" Plugin 'edthedev/minion'
" Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'junegunn/goyo.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'einars/js-beautify'
Plugin 'mikewest/vimroom'
Plugin 'junegunn/vim-easy-align'
Plugin 'wting/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'marijnh/tern_for_vim'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-dispatch'
Plugin 'keith/swift.vim'
Plugin 'leafgarland/typescript-vim'

filetype plugin indent on " Enable filetype-specific indenting and plugins

set fileformat=mac
set t_Co=256

set pastetoggle=<F5>
nmap <F8> :TagbarToggle<CR>


syntax on                 " Enable syntax highlighting
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
" Clear old autocmds in group
autocmd!
" autoindent with two spaces, always expand tabs
autocmd FileType ruby,eruby,yaml,less,css,html,scss,javascript,typescript set ai sw=2 sts=2 et
autocmd FileType php set ai sw=4 sts=4 et
augroup END

syntax on
set number
set background=dark
colo solarized

let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
	set t_ts=^[k
	set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
	set title
endif

" autocmd VimEnter * NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

iab envr #!/usr/bin/env ruby

let g:mustache_abbreviations = 1
let g:airline#extensions#tabline#enabled = 1

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

map gn :bn<cr>
map gp :bp<cr>

au FileType go nmap <Leader>v GoVet
" au BufWritePost *.go silent! !ctags -R -f $GOPATH/.tags *.go &
" au BufWritePost *.go silent! GoFmt!
" au BufWritePost *.go GoLint

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

" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" au FileType haml IndentGuidesEnable
" au FileType haml let indent_guides_auto_colors = 0
" au FileType haml hi IndentGuidesOdd  guibg=darkgrey   ctermbg=236
" au FileType haml hi IndentGuidesEven guibg=darkgrey   ctermbg=237
" au FileType haml let indent_guides_color_change_percent = 10
" au FileType haml let indent_guides_guide_size = 1

" set t_ut=
"
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>

nnoremap <Leader>vr :VimroomToggle<CR>
nnoremap <Leader>sp :setlocal spell spelllang=en_us<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

let g:haddock_browser="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['golint']
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

let g:airline_powerline_fonts = 1
set statusline+=%{fugitive#statusline()}
set laststatus=2

set splitright

autocmd FileType typescript call s:typescript_filetype_settings()
function! s:typescript_filetype_settings()
	set makeprg=tsc
endfunction

let g:syntastic_typescript_tsc_args = '--target ES6 --moduleResolution node --jsx'
