-- npm install -g vim-language-server
require'lspconfig'.vimls.setup {
    cmd = {DATA_PATH .. "/lsp_servers/vim/node_modules/.bin/vim-language-server", "--stdio"},
    on_attach = require'config.lsp'.common_on_attach
}