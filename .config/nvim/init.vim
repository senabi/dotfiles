"Sets
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
set termguicolors

"other sets
set path+=**
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

"Plugins
call plug#begin('~/.vim/plugged')
"
"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
"Theme
Plug 'gruvbox-community/gruvbox'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
colorscheme gruvbox
lua require'colorizer'.setup()
"editor
highlight Normal ctermbg=none
highlight NonText ctermbg=none
"highlight Normal guibg=none
"highlight NonText guibg=none

"syntax on
"highlight ColorColumn guibg=#464646

"lets
let  mapleader = " "

"remaps
"normal no recursive execution map
"project wide search: word search on this project
nnoremap <leader>sp :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ") })<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"so is this the greatest one?
"paste on whatever i have selected without loosing the register
vnoremap <leader>p "_dP
"now use the clipboard
vnoremap <leader>P "_d"+P
"from clipboard?
nnoremap <leader>p "+p

"the greatest one? or is it this one?
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>d "_d
vnoremap <leader>d "_d

"autocommands
fun! TrimWhitespace()
    let l:save=winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"auto groups that clears all the commands associated with this group
"
"my group
augroup SSGROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
