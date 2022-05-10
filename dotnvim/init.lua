CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

require('plugins')
require('settings')
require('autocmd')
require('keybinds')

-- require('config.lsp')
-- require('config.lsp.angular-ls')
-- require('config.lsp.bash-ls')
-- require('config.lsp.clangd')
-- require('config.lsp.cmake-ls')
-- require('config.lsp.css-ls')
-- require('config.lsp.dart-ls')
-- require('config.lsp.docker-ls')
-- require('config.lsp.efm-general-ls')
-- require('config.lsp.elm-ls')
-- require('config.lsp.emmet-ls')
-- require('config.lsp.graphql-ls')
-- require('config.lsp.go-ls')
-- require('config.lsp.html-ls')
-- require('config.lsp.json-ls')
-- require('config.lsp.js-ts-ls')
-- require('config.lsp.kotlin-ls')
-- require('config.lsp.latex-ls')
-- require('config.lsp.lua-ls')
-- require('config.lsp.php-ls')
-- require('config.lsp.python-ls')
-- require('config.lsp.ruby-ls')
-- require('config.lsp.rust-ls')
-- require('config.lsp.svelte-ls')
-- require('config.lsp.terraform-ls')
-- require('config.lsp.tailwindcss-ls')
-- require('config.lsp.vim-ls')
-- require('config.lsp.vue-ls')
-- require('config.lsp.yaml-ls')
-- require('config.lsp.elixir-ls')
