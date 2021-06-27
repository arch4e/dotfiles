"## Settings ##"

set nocompatible
set fenc=utf-8
set nobackup
set noswapfile
set noundofile
set autoread
set hidden
set showcmd

set title
set number
"set relativenumber
set showmatch
set smartindent
set t_Co=256
set laststatus=2
set matchtime=1
set pumheight=10 
set display=lastline
set wildmode=list:longest
set scrolloff=5
let g:netrw_dirhistmax = 0
syntax on
colorscheme peachpuff

"## Tab ##
set list listchars=tab:>-
set expandtab
set tabstop=2
set shiftwidth=2

"## Search ##
set noincsearch
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

"## Control ##
set backspace=2

" ## Keymap ##
inoremap <silent> jj <ESC>
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap ; :

nnoremap <S-k> 10<UP>
nnoremap <S-j> 10<DOWN>
nnoremap <S-h> 10<LEFT>
nnoremap <S-l> 10<RIGHT>

vnoremap <S-k> 10<UP>
vnoremap <S-j> 10<DOWN>
vnoremap <S-h> 10<LEFT>
vnoremap <S-l> 10<RIGHT>

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

"## Plug in ##
" lightline
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'PaperColor'
    \ }

"NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

