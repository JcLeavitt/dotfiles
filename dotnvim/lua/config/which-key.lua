require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

-- Set leader
-- vim.api.nvim_set_keymap('n', ',', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ','

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

-- no hl
-- vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer/nvim-tree
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- focus -- nice splits
vim.api.nvim_set_keymap('n', '<leader>H', ':FocusSplitLeft<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>J', ':FocusSplitDown<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>K', ':FocusSplitUp<CR>', {noremap = true,  silent = true })
vim.api.nvim_set_keymap('n', '<leader>L', ':FocusSplitRight<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':FocusSplitCycle<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':FocusSplitCycle reverse<CR>', {noremap = true, silent = true })

-- GBrowse
vim.api.nvim_set_keymap("v", "<leader>w", ":GBrowse<CR>", {noremap = true, silent = false})
vim.api.nvim_set_keymap("v", "<leader>b", ":GBrowse<CR>", {noremap = true, silent = false})

-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd
local vmappings = {
    ["/"] = {"<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment"}
}

local mappings = {
    ["/"] = "Comment",
    ["e"] = "Explorer",
    -- ["h"] = "No Highlight",
    -- ["P"] = "Projects", -- this a telescope thing?

    b = {
        name = "Buffers",
        c = {"<cmd>BufferClose<cr>", "Close"},
        d = {"<cmd>BufferLineSortByDirectory<cr>", "Sort by directory"},
        e = {"<cmd>BufferLinePickClose<cr>", "Pick which buffer to close"},
        g = {"<cmd>BufferCloseBuffersRight<cr>", "Close all to the right"},
        h = {"<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left"},
        l = {"<cmd>BufferLineSortByExtension<cr>", "Sort by language"},
        p = {"<cmd>BufferLineCyclePrev<cr>", "Previous"},
    },

    d = {
        name = "+Diagnostics",
        d = {"<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document"},
        l = {"<cmd>TroubleToggle loclist<cr>", "loclist"},
        q = {"<cmd>TroubleToggle quickfix<cr>", "quickfix"},
        r = {"<cmd>TroubleToggle lsp_references<cr>", "references"},
        t = {"<cmd>TroubleToggle<cr>", "trouble"},
        w = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace"},
    },

    D = {
        name = "+Debug",
        b = {"<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint"},
        c = {"<cmd>DebugContinue<cr>", "Continue"},
        i = {"<cmd>DebugStepInto<cr>", "Step Into"},
        o = {"<cmd>DebugStepOver<cr>", "Step Over"},
        r = {"<cmd>DebugToggleRepl<cr>", "Toggle Repl"},
        s = {"<cmd>DebugStart<cr>", "Start"},
    },

    g = {
        name = "+Git",
        B = {"<cmd>GitBlameToggle<cr>", "Toggle blame on current line"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"},
        R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
        a = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        b = {"<cmd>Git blame<cr>", "Open blame window"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        j = {"<cmd>NextHunk<cr>", "Next Hunk"},
        k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        s = {"<cmd>StageHunk<cr>", "Stage Hunk"},
        u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"},
        w = {"<cmd>GBrowse<cr>", "Open in git browser"},
    },

    q = {
        name = "Quickfix List",
        c = {"<cmd>cclose<cr>", "Close"},
        n = {"<cmd>cn<cr>", "Next"},
        o = {"<cmd>copen<cr>", "Open"},
        p = {"<cmd>cp<cr>", "Previous"},
    },

    h = {
        name = "Harpoon",
        c = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Close"},
        o = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Open"},
    },

    l = {
        name = "+LSP",
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        D = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics toggle"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        N = {"<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous Diagnostic"},
        R = {"<cmd>lua require'lint'.try_lint()<cr>", "Load Revive (nvim-lint)"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"},
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics toggle"},
        f = {"<cmd>LspFormatting<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        n = {"<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
    },

    p = {
        name = "+Plz | Project",
        b = {"<cmd>term plz build<cr>", "plz build"},
        t = {"<cmd>term plz test<cr>", "plz test"},
        v = {"<cmd>:Lexplore<cr>", "Open netrw file browser"},
    },

    P = {
        name = "Packer",
        S = {"<cmd>PackerStatus<cr>", "Status"},
        c = {"<cmd>PackerCompile<cr>", "Compile"},
        i = {"<cmd>PackerInstall<cr>", "Install"},
        r = {"<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile"},
        s = {"<cmd>PackerSync<cr>", "Sync"},
        u = {"<cmd>PackerUpdate<cr>", "Update"},
    },

    s = {
        name = "+Search",
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope diagnostics<cr>", "Document Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
    },

    S = {name = "+Session",
        l = {"<cmd>SessionLoad<cr>", "Load Session"},
        s = {"<cmd>SessionSave<cr>", "Save Session"},
    },

    t = {
        name = "Telescope",
        r = {"<cmd>Telescope resume<cr>", "Resume"},
        f = {
            name = "Find",
            b = {"<cmd>Telescope buffers<cr>", "Find Buffers"},
            c = {"<cmd>Telescope command_history<cr>", "List Commands That Were Executed"},
            f = {"<cmd>Telescope find_files<cr>", "Find File"},
            g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep"},
            h = {"<cmd>Telescope help_tags<cr>", "Find Help Tags"},
            q = {"<cmd>Telescope quickfix<cr>", "List Items In The Quikcfix List"},
            s = {"<cmd>Telescope grep_string<cr>", "Find String Under Cursor"},
        },
        l = {
            name = "Lsp",
            c = {"<cmd>Telescope lsp_code_actions<cr>", "Code Actions for word under cursor"},
            d = {"<cmd>Telescope lsp_definitions<cr>", "GoTo Definition"},
            i = {"<cmd>Telescope lsp_implementations<cr>", "GoTo Implementation"},
            r = {"<cmd>Telescope lsp_references<cr>", "References for word under cursor"},
        },
        t = {
            name = "Treesitter",
            t = {"<cmd>Telescope treesitter<cr>", "List Function names, variables, from Treesitter"},
        },
    },

    T = {
        name = "Trouble",
        d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics toggle"},
        n = {"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", "Next"},
        p = {"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", "Previous"},
        q = {"<cmd>TroubleToggle quickfix<cr>", "Quickfix list toggle"},
        w = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics toggle"},
    },
}

local wk = require("which-key")
wk.register(mappings, opts)
wk.register(vmappings, vopts)


-----------         Suggested Mappings for lspconfigIG
-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, bufopts)
--   vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--   vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
-- end
--
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       -- This will be the default in neovim 0.7+
--       debounce_text_changes = 150,
--     }
--   }
-- end
