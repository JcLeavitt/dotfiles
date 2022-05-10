local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
    "bashls",
    "dockerls",
    "efm",
    "eslint",
    "gopls",
    "jsonls",
    "sumneko_lua",
    "jedi_language_server",
    "pylsp",
    "pyright",
    "vimls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end
