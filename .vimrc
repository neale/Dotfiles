if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Syntax highlighters
NeoBundle 'tpope/vim-markdown'
NeoBundle 'hdima/python-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'slava/vim-spacebars'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'JuliaLang/julia-vim'

" HTML, javascript
NeoBundleLazy 'jelera/vim-javascript-syntax', { 'autoload': { 'filetypes': ['javascript'] } }
NeoBundleLazy 'guileen/simple-javascript-indenter', { 'autoload': { 'filetypes': ['javascript'] } }

" Random settings
imap <C-c> <CR><Esc>O
set expandtab
set shiftwidth=2
set softtabstop=2
set number

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on

