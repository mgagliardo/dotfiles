"GlobalConfig
set nocompatible
filetype plugin on
set secure

set paste
set number
set cursorline
syntax on
set tabstop=2
set shiftwidth=4
set expandtab

"Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
  "StatusLine at bottom
  Plug 'vim-airline/vim-airline', { 'tag': 'v0.11' }
  "Multi-Lang support
  Plug 'sheerun/vim-polyglot', { 'tag': 'v4.17.1' }
  "Required for telescope
  Plug 'nvim-lua/plenary.nvim', { 'tag': 'v0.1.4' }
  Plug 'nvim-treesitter/nvim-treesitter', { 'tag': 'v0.10.0' }
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
  "Markdown preview
  Plug 'OXY2DEV/markview.nvim', { 'tag': 'v25.9.0' }
  "Best colorscheme ever
  Plug 'folke/tokyonight.nvim', { 'tag': 'v4.14.1' }
  "Pyrefly
  Plug 'neovim/nvim-lspconfig', { 'tag': 'v2.5.0' }
  Plug 'mason-org/mason.nvim', { 'tag': 'v2.0.1' }
  Plug 'mason-org/mason-lspconfig.nvim', { 'tag': 'v2.1.0' }
  "File Explorer + Icons
  Plug 'nvim-tree/nvim-tree.lua', { 'tag': 'v1.14.0' }
  Plug 'nvim-tree/nvim-web-devicons', { 'branch': 'master' }
call plug#end()

"Enabling Plugins
colorscheme tokyonight-night

