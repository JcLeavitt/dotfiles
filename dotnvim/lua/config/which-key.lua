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
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 } -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- Set leader
-- vim.api.nvim_set_keymap('n', ',', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ','

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', ':Telescope treesitter<CR>', { noremap = true, silent = true })

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", { noremap = true, silent = true })

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", { noremap = true, silent = true })

-- Copilot panel
vim.api.nvim_set_keymap("n", "<leader>C", ":Copilot panel<CR>", { noremap = true, silent = true })

-- GBrowse
vim.api.nvim_set_keymap("v", "<leader>w", ":GBrowse<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", "<leader>b", ":GBrowse<CR>", { noremap = true, silent = false })

-- Focus Splits
vim.api.nvim_set_keymap('n', '<leader>H', ':FocusSplitLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>J', ':FocusSplitDown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>K', ':FocusSplitUp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>L', ':FocusSplitRight<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':FocusSplitCycle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':FocusSplitCycle reverse<CR>', { noremap = true, silent = true })
-- TODO create entire treesitter section

local mappings = {
    ["/"] = "Comment",
    ["c"] = "Close Buffer",
    ["C"] = "Copilot Panel",
    ["e"] = "Explorer",
    ["f"] = "Find Files",
    ["h"] = "No Highlight",
    ["P"] = "Projects",

    d = {
        name = "+Diagnostics",
        F = { "<cmd>Trouble lsp_type_definitions<cr>", "LSP Type Definitions" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
        f = { "<cmd>Trouble lsp_definitions<cr>", "LSP Definitions" },
        l = { "<cmd>Trouble loclist<cr>", "items from the window's location list" },
        m = { "<cmd>TroubleToggle<cr>", "Trouble Toggle Mode" },
        q = { "<cmd>Trouble quickfix<cr>", "quickfix items" },
        r = { "<cmd>Trouble lsp_references<cr>", "LSP References" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    },

    D = {
        name = "+Debug",
        b = { "<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint" },
        c = { "<cmd>DebugContinue<cr>", "Continue" },
        i = { "<cmd>DebugStepInto<cr>", "Step Into" },
        o = { "<cmd>DebugStepOver<cr>", "Step Over" },
        r = { "<cmd>DebugToggleRepl<cr>", "Toggle Repl" },
        s = { "<cmd>DebugStart<cr>", "Start" },
    },

    g = {
        name = "+Git",
        B = { "<cmd>GitBlameToggle<cr>", "Toggle blame on current line" },
        C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
        R = { "<cmd>ResetBuffer<cr>", "Reset Buffer" },
        a = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        b = { "<cmd>Git blame<cr>", "Open blame window" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        j = { "<cmd>NextHunk<cr>", "Next Hunk" },
        k = { "<cmd>PrevHunk<cr>", "Prev Hunk" },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        p = { "<cmd>PreviewHunk<cr>", "Preview Hunk" },
        r = { "<cmd>ResetHunk<cr>", "Reset Hunk" },
        s = { "<cmd>StageHunk<cr>", "Stage Hunk" },
        u = { "<cmd>UndoStageHunk<cr>", "Undo Stage Hunk" },
        w = { "<cmd>GBrowse<cr>", "Open in git browser" },
    },

    l = {
        name = "+LSP",
        F = { "<cmd>LspFormatting<cr>", "Format" },
        l = { "<cmd>lua require'lint'.try_lint()<cr>", "Load Revive (nvim-lint)" },
        i = { "<cmd>:LspInfo<cr>", "Connected Language Servers" },
    },

    -- Navigator - show keybindings--window


    T = {
        name = "+Telescope",
        C = { "<cmd>cclose<cr>", "Close Quickfix" },
        F = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        m = { "<cmd>Telescope marks<cr>", "Marks" },
        o = { "<cmd>Telescope frecency<cr>", "Find Recent Files" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
    },

    S = {
        name = "+Session",
        s = { "<cmd>SessionSave<cr>", "Save Session" },
        l = { "<cmd>SessionLoad<cr>", "Load Session" }
    },

    p = {
        name = "+Plz | Project",
        b = { "<cmd>term plz build<cr>", "plz build" },
        t = { "<cmd>term plz test<cr>", "plz test" },
        v = { "<cmd>:Lexplore<cr>", "Open netrw file browser" },
        w = { "<cmd>term plz watch<cr>", "plz watch" },
    },
}





local wk = require("which-key")
wk.register(mappings, opts)
