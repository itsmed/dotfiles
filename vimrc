" General
"
" ------------------------------------
set nocompatible " not like you, vi!

" core parameters
" enable syntax highlighting
syntax enable
syntax on
autocmd StdinReadPre * let s:std_in=1
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
set re=0 " for typescript and jsx redraw time error

" searching
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set showmatch " jump to match
set smartcase " ... Unless they contain at least one capital letter
set mouse=a " enable mouse support 

set modelines=0 " prevent some security exploits w/modelines


" backups
set nobackup " don't make backup files
set directory=~/.vim/swp/

" all utf-8 all the time
set encoding=utf-8

" Plugins
" ------------------------------------
" Required for Vundle
filetype off


" Colors and fonts
" ------------------------------------



" User interface
" ------------------------------------

" directory changes depending on what file you're working with
set autochdir

" easiest for interacting with system clipboard
set clipboard=unnamed

" basics
set number " line numbers
set ruler " show cursor position all the time
set nojoinspaces " Do not insert 2 spaces after sentences when joining
set ttyfast " Improve smoothness of redraw for newer terminals
set whichwrap+=h,l " Allow cursor keys to line wrap
set noerrorbells " disable the ping
set showmode " show what mode we're in
set showcmd " display incomplete commands
set wildmenu " better tab-completion for commands
set wildmode=list:longest " list all matches, complete til longest common string
set backspace=indent,eol,start " backspace through everything in insert mode
set cursorline " highlight the current line

set splitbelow " open horizontal split below current
set splitright " open vertical split to the right

" statusline
set ls=2 " always show the status bar
set statusline=%F\ %m%r%w%y\ %{fugitive#statusline()}\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

" show them listchars
set list
set listchars=nbsp:·,eol:↵,extends:>,precedes:<,tab:\|\

" Text handling
" ------------------------------------

" tabs and indenting
set autoindent " copy indent from current line
set expandtab " use spaces, not tabs
set tabstop=4 " a tab is 4 spaces
set shiftwidth=4 " an indent is 4 spaces
set smarttab " don't need this?
set softtabstop=4
set nowrap " don't wrap lines


" Indent bulleted lists properly
set comments=://,b:#,:%,:XCOMM,n:>,fb:-,fb:*

" Enable markdown folding
let g:markdown_folding = 1

" Change default format options:
set formatoptions-=t  " turn off auto-wrapping type
set formatoptions-=c  " turn off auto-wrapping comments
set formatoptions-=r  " turn off auto-inserting insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions+=q  " format comments manually with gq
set formatoptions+=n  " gq recognizes numbered lists
set formatoptions+=1  " prefer breaking before, not after, a one-letter word

" simply hit enter to clear highlighting after a search
nnoremap <silent> <CR> :noh<CR>

" Ctrl+P fuzzy file finding
noremap <C-p> :Files<Cr>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" fzf
Plugin 'junegunn/fzf'

" nerdtree
Plugin 'preservim/nerdtree'
" tagbar
Plugin 'majutsushi/tagbar'
"vim surround
Plugin 'tpope/vim-surround'
" git nerdtree integration
Plugin 'xuyuanp/nerdtree-git-plugin'
" the above relies on the below
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" linting
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
execute pathogen#infect()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" debugging
packadd termdebug
