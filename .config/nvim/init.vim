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
set listchars=eol:¬,tab:->,trail:-,space:•
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list
set signcolumn=yes
set isfname+=@-@
set updatetime=50
set cmdheight=1
set timeoutlen=1000

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
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
set shortmess+=c
" Enable completions as you type

"Plugins
call plug#begin('~/.vim/plugged')
"lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
"Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/lsp-status.nvim'
"Zig
Plug 'ziglang/zig.vim'
"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
"Git
Plug 'tpope/vim-fugitive'
"Theme
Plug 'gruvbox-community/gruvbox'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
"Formatter
"Plug 'sbdchd/neoformat'
"Plug 'sheerun/vim-polyglot'
"Python
Plug 'ambv/black'
" [11] Move code
Plug 'tpope/vim-unimpaired'
" [12] Auto close brackets, parenthesis, etc
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'google/vim-maktaba'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'google/vim-codefmt'
Plug 'preservim/nerdcommenter'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
"Rust
"Plug 'rust-lang/rust.vim'
"Go
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }"
"Plug 'mhartington/nvim-typescript'
call plug#end()
colorscheme gruvbox
lua require'colorizer'.setup()
lua require'nvim-treesitter.configs'.setup { highlihgt = { enable = true } }
lua require("nabi")

"if executable('rg')
"    let g:rg_derive_root='true'
"endif

"RainbowParentheses
"editor
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

highlight NonText guifg=#464646

"lets
let mapleader = " "
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_winsize = 25
"lsp
let g:completion_enable_auto_popup = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" [9]
" Enable vim-prettier to run in files without requiring the "@format" doc tag
let g:prettier#autoformat = 0
let g:prettier#config#tab_width = 4
"none" - No trailing commas.
"es5" - Trailing commas where valid in ES5 (objects, arrays, etc.)
"all" - Trailing commas wherever possible (including function arguments). This requires node 8 or a transform.
let g:prettier#config#trailing_comma = 'es5'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier

let g:NERDCreateDefaultMappings = 0

" [11]
" Move single lines
nmap <C-k> [e
nmap <C-j> ]e
" Move multiple lines selected
vmap <C-k> [egv
vmap <C-j> ]egv

nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle
"nmap <
"vmap

"telescope
"git
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
"fuzzy grep
nnoremap <leader>gf :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
"file finder
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
"buffer finder
nnoremap <leader>bf :lua require('telescope.builtin').buffers()<CR>
"git branches
nnoremap <leader>gc :lua require('nabi.telescope').git_branches()<CR>
"word finder
nnoremap <leader>wf :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
" livegrep
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"remaps
"normal no recursive execution map
"project wide search: word search on this project "i name it fuzzy search
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv
"so is this the greatest one?
"paste on whatever i have selected without loosing the register
vnoremap <leader>p "_dp
"now use the clipboard
vnoremap <leader>P "_d"+p
"from clipboard?
nnoremap <leader>p "+p

"the greatest one? or is it this one?
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>d "_d
vnoremap <leader>d "_d
nnoremap <leader>t :Ex<CR>

"lsp
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
"nnoremap <leader>vll :call LspLocationList()<CR>

"Git
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

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
    "autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

augroup autoformat_settings
  "autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  "autocmd FileType gn AutoFormatBuffer gn
  "autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  "autocmd FileType vue AutoFormatBuffer prettier
augroup END
