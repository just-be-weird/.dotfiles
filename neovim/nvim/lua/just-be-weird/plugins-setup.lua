local status, packer = pcall(require, 'packer')

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

if (not status) then
    print('Packer is not installed')
    return
end

packer.startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    ----------------------
    --  Plugins
    ---------------------- 
    -- Common utilities/lua functions that many plugins use
    use 'nvim-lua/plenary.nvim'

    -- Preferred colorscheme
    use 'bluz71/vim-nightfly-guicolors'

    -- Tmux & split window navigation
    use 'christoomey/vim-tmux-navigator'

    -- Maximizes and restores current window
    use 'szw/vim-maximizer'

    -- Commenting with gc
    use 'numToStr/Comment.nvim'

    -- Fuzzy finder
    use 'nvim-telescope/telescope.nvim'

    -- File explorer
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- File fuzzy finding w/ telescope (dependency for better sorting performance)
    -- use({
    --     'nvim-telescope/telescope-fzf-native.nvim',
    --     run = 'make'
    -- })

    -- File icons (vs-code like icons)
    use 'kyazdani42/nvim-web-devicons'

    -- [[ Statusline ]]
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/nvim-bufferline.lua'

    -- [[ Autocompletion ]]

    -- Completion plugin
    use 'hrsh7th/nvim-cmp'
    -- for autocompletion
    use('saadparwaiz1/cmp_luasnip')
    -- nvim-cmp source for text/words in buffer
    use 'hrsh7th/cmp-buffer'

    -- [[ Snippets ]]

    -- snippet engine
    use 'L3MON4D3/LuaSnip'
    -- useful snippets
    -- use 'rafamadriz/friendly-snippets'

    -- [[ Managing & installing lsp servers, linters & formatters ]]

    -- in charge of managing lsp servers, linters & formatters
    use 'williamboman/mason.nvim'
    -- bridges gap b/w mason & lspconfig
    use 'williamboman/mason-lspconfig.nvim'

    -- [[ Configuring lsp servers ]]

    -- easily configure LSP language servers
    use 'neovim/nvim-lspconfig'
    -- nvim-cmp source for neovim's built-in LSP for Autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    -- enhanced lsp uis
    use({
        'glepnir/lspsaga.nvim',
        branch = 'main'
    })
    -- additional functionality for typescript server (e.g. rename file & update imports)
    use('jose-elias-alvarez/typescript.nvim')
    -- vs-code like icons for autocompletion in pictograms
    use 'onsails/lspkind-nvim'

    -- [[ Formatting & linting ]]

    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'jose-elias-alvarez/null-ls.nvim'
    -- Bridges gap b/w mason & null-ls
    use 'jayp0521/mason-null-ls.nvim'

    -- Treesitter configuration
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({
                with_sync = true
            })
        end
    }

    -- [[ Auto closing ]]

    -- autoclose parens, brackets, quotes, etc...
    use 'windwp/nvim-autopairs'
    -- autoclose tags
    use({
        'windwp/nvim-ts-autotag',
        after = 'nvim-treesitter'
    })

    -- [[ Colors ]]
    use 'norcalli/nvim-colorizer.lua'

    -- [[ GIT integration ]]

    -- Show line modifications on left hand side
    use 'lewis6991/gitsigns.nvim'
    -- For git blame & browse
    use 'dinhhuy258/git.nvim'

    -- [[ Markdown support ]]
    use({
        'iamcco/markdown-preview.nvim',
        run = function()
            vim.fn['mkdp#util#install']()
        end
    })

    -- [[ Mode ]]
    use 'folke/zen-mode.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
