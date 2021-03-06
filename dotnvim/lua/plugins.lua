-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

-- TODO add:
-- set up quickfix list <ctrl q> with telescope
-- set up telescope to search project
-- and add stuff to which-key
local use = require('packer').use
require('packer').startup(function()
    use {"nvim-lua/plenary.nvim"}

    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"
    -- use {"wbthomason/packer.nvim", event = "VimEnter"}

    use {"neovim/nvim-lspconfig"}
    use {"williamboman/nvim-lsp-installer"}
    use {"onsails/lspkind-nvim"} -- vscode-like pictograms for cmp
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("config.signature")
        end
    }

    -- Debugging
    use {"mfussenegger/nvim-dap"}

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim'},
        },
        config = function()
            require("config.telescope")
        end
    }
	 
	-- Jennings'  ********************************-------------|

    use {
            "beauwilliams/focus.nvim",
            config = function()
                    require('config.focus')
            end
    }

    use {
        "simrat39/symbols-outline.nvim",
        config = function()
            require('config.symbols-outline')
        end
    }

	-- End of Jennings' plugins ******************---------|

    -- TODO use the terminal related commands
    use {'ThePrimeagen/harpoon',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope.nvim'},
        },
    }

    -- Autocomplete
    -- must declare these sources in the cmp config file
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.cmp")
        end,
        -- wants = { "LuaSnip" },
        -- requires = {
        --     {
        --         "L3MON4D3/LuaSnip",
        --         event = "BufReadPre",
        --         wants = "friendly-snippets",
        --         requires = {
        --             "rafamadriz/friendly-snippets",
        --             "luasnip_snippets.nvim",
        --         }
        --     },{
        --         "windwp/nvim-autopairs",
        --         event = "BufReadPre",
        --     },
        -- },
        -- TODO this event line causes the plugin to be optional?
        -- event = "InsertEnter",
    }
    use {"hrsh7th/cmp-copilot"}
    use {"hrsh7th/cmp-buffer"}
    use {"hrsh7th/cmp-path"}
    use {"hrsh7th/cmp-nvim-lua"}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"hrsh7th/cmp-calc"}
    use {"f3fora/cmp-spell"}
    -- not a huge fan of this one
    -- use {"hrsh7th/cmp-cmdline"}
    use {"hrsh7th/cmp-emoji"}
    use {"David-Kunz/cmp-npm", requires = {'nvim-lua/plenary.nvim'}}
    -- TODO maybe have this ripgrep the whole project rather than just cwd
    -- TODO dont think this is working
    use {"lukas-reineke/cmp-rg"}

    -- use {"rafamadriz/friendly-snippets"}
    -- use {"molleweide/LuaSnip-snippets.nvim"}
    -- TODO when a snippet completes then we should have a keybinding for jumping between the values for filling it out
    -- use {"L3MON4D3/LuaSnip", 
    --     requires = {'nvim-lua/plenary.nvim'},
    --     config = function()
    --         require("config.luasnip")
    --     end
    -- }
    -- use {"saadparwaiz1/cmp_luasnip"}

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter")
        end
    }
    use {"windwp/nvim-ts-autotag"}
    use {
        'andymass/vim-matchup',
        config = function()
            require("config.matchup")
        end
    }
    -- show you which function you're looking at at the top of the screen
    use {"romgrk/nvim-treesitter-context"}
    -- make matching parens and stuff different colors
    use {"p00f/nvim-ts-rainbow"}
    -- makes extra pairs that work with %
    use {"theHamsta/nvim-treesitter-pairs"}
    -- auto highlight the current word
    use {"RRethy/vim-illuminate"}

    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end
    }
    -- this is auto disabled, can toggle it on using <leader>gB
    use {"f-person/git-blame.nvim"}

    use {
        "folke/which-key.nvim",
        config = function()
            require("config.which-key")
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("config.autopairs")
        end
    }

    -- Comments with treesitter support
    use {'terrortylor/nvim-comment',
        config = function()
            require("config.comment")
        end
    }
    use {'JoosepAlviste/nvim-ts-context-commentstring'}

    -- Jennings

    use {
        "lukas-reineke/indent-blankline.nvim",
        after = "kanagawa.nvim",
        config = function()
            require("config.indent-blankline")
        end
    }

    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function ()
        require("octo").setup()
      end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require("config.nvim-tree")
        end,
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

   use {
        "rebelot/kanagawa.nvim",
            config = function()
                    require('config.kanagawa')
            end
    }

    use {"kyazdani42/nvim-web-devicons"}

    -- TODO setup for nice window to show diagnostics and quickfix, see if others use this
    use {
        "folke/trouble.nvim",
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require("config.trouble")
        end
    }

    -- Status Line and Bufferline
    use {
        "nvim-lualine/lualine.nvim",
        requires = { 'kyazdani42/nvim-web-devicons'},
        config = function()
            require("config.lualine")
        end
    }
    use {
        "romgrk/barbar.nvim",
        config = function()
            require("config.barbar")
        end
    }

    -- Formatter
    use {"sbdchd/neoformat"}
    use {"tpope/vim-sleuth"}
    use {"tpope/vim-repeat"}
    use {
        "editorconfig/editorconfig-vim",
        config = function()
            require("config.editorconfig")
        end
    }
    use {"tpope/vim-fugitive"}
    use {
        "shumphrey/fugitive-gitlab.vim",
        config = function()
            require("config.fugitive")
        end
    }
    use {"tpope/vim-rhubarb"}
    -- TODO vim-go is messing with nvim-lint i think. taking forever to save
    -- the snippets in vim-go are good. also implementing a interface with lsp is nice
    -- use {
    --     'fatih/vim-go',
    --     config = function()
    --         vim.g.syntastic_go_checkers = {}
    --         vim.g.go_fmt_command = ""
    --     end
    -- }
    -- TODO could look into getting this to work instead
    -- use {"~/go/pkg/mod/github.com/zchee/nvim-go@v0.3.0/plugin/nvim-go.vim", opt = true, run = "make"}
    use {
        "mfussenegger/nvim-lint",
        config = function()
            require("config.lint")
        end
    }

    
    use {"github/copilot.vim",
        config = function()
            vim.g.copilot_node_command = '/Users/jennings.leavitt/.nvm/versions/node/v18.0.0/bin/node' 

            vim.cmd("imap <silent><script><expr> <C-J> copilot#Accept(<CR>")
            vim.g.copilot_no_tab_map = true

        end
    }

    -- Speed up Neovim startup time.
    use 'lewis6991/impatient.nvim'
end)
