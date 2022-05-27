require'lspconfig'.gopls.setup {
    cmd = {
        DATA_PATH .. "/lsp_servers/go/gopls",
        "serve"
    },
    
    filetypes = {"go", "gomod", "gotmpl" },
    
    root_dir = require'lspconfig'.util.root_pattern("go.work", "go.mod", ".git", "."),
    
    settings = {
        gopls = {
            analyses = {
                unusedparams = true
            },
            staticcheck = true
        }
    },

    init_options = {
        usePlaceholders = true,
        completeUnimported = true
    },

    on_attach = require'config.lsp'.common_on_attach,
    -- capabilities = require'config.lsp'.common_capabilities,
}
