" Filetype options
set fileformat=unix
set encoding=utf-8
set nocompatible
set mouse=a

" Automatic vim-plug installation for new systems
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" vim-plug setup
call plug#begin('~/.vim/plugged')

" (Colorschemes)
Plug 'artanikin/vim-synthwave84'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'
Plug 'doums/darcula'

" (General)
Plug 'tmhedberg/SimpylFold'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'

" (Python)
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
Plug 'nvie/vim-flake8', {'for': 'python'}

" (Rust)
"Plug 'rust-lang/rust.vim', {'for': 'rust'}

" vim-plug end
call plug#end()

" Display options
set background=dark
if has('+termguicolors')
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors " 24-bit terminal
endif

" Colorscheme configs
let g:gruvbox_material_background='hard'
" let g:gruvbox_material_transparent_background=1
let g:gruvbox_material_enable_bold=1
let g:gruvbox_material_enable_italic=1
let g:sonokai_style='andromeda'
let g:sonokai_enable_bold=1
let g:sonokai_enable_italic=1
" colorscheme gruvbox-material

" Airline configs
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
" To be used with MesloLGS NF Fonts
" let g:airline#extensions#tabline#left_sep=' '
" let g:airline#extensions#tabline#left_alt_sep=' '
" let g:airline#extensions#tabline#right_sep=' '
" let g:airline#extensions#tabline#right_alt_sep=' '

" Tmuxline configs
let g:tmuxline_preset='full'

" Formatting and general display
syntax on
set sc
set nu
set relativenumber
set colorcolumn=80
set textwidth=79
set nowrap

" Language and completion specific settings
let python_highlight_all=1
let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_enable_semantic_highlighting=1
" let g:rustfmt_autosave=1

" Mute bell (WSL specific) and show errors graphically
set visualbell
set t_vb=

" Search options
set hlsearch
set incsearch
set smartcase
set ignorecase

" Indent options
function! UseSpaces()
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
  set expandtab
  set smarttab
endfunction

function! UseTabs()
  set tabstop=4
  set shiftwidth=0
  set softtabstop=4
  set noexpandtab
endfunction

" Indent options (default)
set tabstop=4 shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set smartindent
set autoindent

" Enable folding
set foldmethod=indent
set foldlevel=99

" Control options
let mapleader=" "

" Save file with leader + w
map <leader>w :w<CR>

" Let YCM go to definitions
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Start Python interpreter from vim
map <leader>py :!python3<CR>
" Run current buffer as a Python script
map <leader>pp :!python3 %<CR>
" Same thing for Neovim
" map <leader>npy :terminal python3<CR>i
" map <leader>npp :terminal python3 %<CR>i

" Fold control
nnoremap H za
" (Make "Y" behave the same as "D" and "C")
nnoremap Y y$

" Make Vim autotype matching characters
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"inoremap < <><Left>
"inoremap " <Left>
"inoremap ' ''<Left>

" (Keep cursor centered when searching through files)
nnoremap n nzzzv
nnoremap N Nzzzv
" 'Pull' lower line to end of the line under the cursor
nnoremap J mzJ`z

" (Undo break points)
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" (Moving text)
vnoremap J :m '>+1<CR>gv-gv
vnoremap K :m '<-2<CR>gv-gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Moving between open buffers
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>
" Close current buffer
nnoremap <leader>bd :bd<CR>

" Moving between split-window buffers
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Templates
" au BufNewFile *.c 0r ~/.vim/skel/skel.c
" au BufNewFile *.py 0r ~/.vim/skel/skel.py
" au BufNewFile *.sh 0r ~/.vim/skel/skel.sh
" au BufNewFile *.html 0r ~/.vim/skel/skel.html
