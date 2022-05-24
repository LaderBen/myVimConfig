let mapleader=" "
syntax enable
colorscheme gruvbox
set background=dark
set number
set relativenumber
set cursorline
set wrap
set linebreak
set showcmd
set wildmenu
set encoding=utf-8
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
set mouse=a
set t_Co=256
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=5
set sidescrolloff=15
set laststatus=2
set ruler
set nobackup
set noswapfile
set list
set listchars=tab:»▪,trail:▪
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
" cursor shape configration
"
" reference chart of values:
"		ps = 0	-> blinking block.
"		ps = 1	-> blinking block (default).
"		ps = 2	-> steady block.
"		ps = 3	-> blinking underline.
"		ps = 4	-> steady underline.
"		ps = 5	-> blinking bar (xterm).
"		ps = 6	-> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[0 q"

set autochdir
au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
exec "nohlsearch"
imap jj <Esc>
noremap <LEADER><CR> :nohlsearch<CR>

noremap J 5j
noremap K 5k

" F5 to run sh/python3
map <F5> :call CompilerRunGcc()<CR>
func! CompilerRunGcc()
	exec "w"
	if &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python3 %"
	elseif &filetype == 'java'
		exec "!time javac %"
		exec "!time java %<"
	elseif &filetype == 'c' || &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	endif
endfunc

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

""" split window
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>

""" 横竖分屏切换
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

""" 光标在分屏间移动
map <LEADER>l <C-w>l
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h

""" resize window
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

""" open a new tag
map tu :tabe<CR>
map tn :-tabnext<CR>
map tN :+tabnext<CR>

""" open NEARDTree
map tt :NERDTree<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

""" vim-table-mode
map <LEADER>tm :TableModeToggle<CR>

"""coc_nvim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"
" Use <Ctrl-Alt-L> to format documents with prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <C-Alt-L> :Prettier<CR>

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'posva/vim-vue'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch':'release'}

call plug#end()
