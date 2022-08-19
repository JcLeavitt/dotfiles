require("nvim-lsp-installer").setup{
  automatic_installation = true
}
-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("nvim-lsp-installer").post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
