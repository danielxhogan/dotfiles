set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
set nohlsearch
set incsearch
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=10
set signcolumn=yes
set guicursor=

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'neovim/nvim-lspconfig'
call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
