set exrc "custom vimrc
set guicursor=
set nu
set nohlsearch
set relativenumber
set hidden "keeps open
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir "undotree
set undofile "undotree plugin
set incsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
"tabs
set tabstop=4 "softtabstop=2
set shiftwidth=4
set expandtab
set smartindent

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
call plug#end()
colorscheme gruvbox
highlight Normal guibg=none

"syntax on
"highlight ColorColumn guibg=#464646
