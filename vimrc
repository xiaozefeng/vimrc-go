set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///Users/xiaozefeng/vim-repo'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'shougo/neocomplete.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Tagbar'
Bundle 'Raimondi/delimitMate'
call vundle#end()
filetype plugin indent on
" :PluginList
" :PluginInstall
" :PluginSearch foo
" :PluginClean
"

syntax on
set enc=utf-8
set langmenu=zh_CN.UTF-8
set fileencoding=utf-8
set fileencodings=utf-8
set nu
set go=
set showcmd
set ruler
" set clipboard+=unnamed
set autoindent
set smartindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set helplang=cn
set viminfo+=!
set showmatch
set ignorecase
set autochdir
set magic
set autowrite
set autoread
set showmode
set noswapfile
set hlsearch
set incsearch
" set cursorcolumn
" set cursorline
set paste
set guifont=Monaco:h16
set shell=/bin/zsh

" vim-go settings
let g:go_fmt_command = "goimports"


" set mapleader
let mapleader = ","

" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" tagbars config
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

" tagbar config
nmap <Leader>tt :TagbarToggle<CR>

" nerdtree config
map <Leader>nn :NERDTreeToggle<CR>

" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
" let g:ycm_key_invoke_completion = '<C-q>'

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
