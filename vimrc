set nocompatible          " We're running Vim, not Vi!
filetype off

" Vundling
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle' 

Bundle 'mileszs/ack.vim'
Bundle 'uggedal/go-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/taglist.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'Blackrush/vim-gocode'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'jcf/vim-latex'
Bundle 'groenewege/vim-less'
Bundle 'plasticboy/vim-markdown'
Bundle 'phleet/vim-mercenary'
Bundle 'slim-template/vim-slim'
Bundle 'skalnik/vim-vroom'

filetype plugin indent on " Enable filetype-specific indenting and plugins

set fileformat=mac
set t_Co=256

set pastetoggle=<F5>


syntax on                 " Enable syntax highlighting
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
" Clear old autocmds in group
autocmd!
" autoindent with two spaces, always expand tabs
autocmd FileType ruby,eruby,yaml,less set ai sw=2 sts=2 et
augroup END

syntax on
set number
colo railscasts

let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
	set t_ts=^[k
	set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
	set title
endif

autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

iab envr #!/usr/bin/env ruby

let g:airline#extensions#tabline#enabled = 1

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

map gn :bn<cr>
map gp :bp<cr>

autocmd Filetype go set makeprg=go\ build
au BufWritePost *.go silent! !ctags -R &
au BufWritePost *.go silent! Fmt

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

au FileType haml IndentGuidesEnable
au FileType haml let indent_guides_auto_colors = 0
au FileType haml hi IndentGuidesOdd  guibg=darkgrey   ctermbg=236
au FileType haml hi IndentGuidesEven guibg=darkgrey   ctermbg=237
au FileType haml let indent_guides_color_change_percent = 10
au FileType haml let indent_guides_guide_size = 1