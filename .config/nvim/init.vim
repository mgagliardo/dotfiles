set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

:lua require"mason".setup()
:lua require"mason-lspconfig".setup()
:lua require"nvim-web-devicons".setup()
:lua require"nvim-tree".setup()

