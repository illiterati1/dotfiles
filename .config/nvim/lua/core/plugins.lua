local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    use {
        'nvim-telescope/telescope.nvim', tag='0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'glts/vim-radical',
        requires = { { 'glts/vim-magnum' } }
    }

    use { 'rose-pine/neovim', as = 'rose-pine' }

    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }}

    use 'jiaoshijie/undotree'

    use 'tpope/vim-capslock'        -- software capslock

    use 'tpope/vim-commentary'

    use 'tpope/vim-characterize'    -- unicode info

    use 'tpope/vim-eunuch'          -- Unix interactions

    use 'tpope/vim-fugitive'

    use 'tpope/vim-surround'

    use 'tpope/vim-repeat'

    use 'tpope/vim-speeddating'

    use 'tpope/vim-tbone'           -- tmux

    use 'tpope/vim-vinegar'         -- netrw enhancement

    use 'airblade/vim-gitgutter'

    use 'vim-test/vim-test'

    use 'svermeulen/vim-easyclip'

    -- use 'folke/trouble'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim',            -- Optional
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end },

            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use 'ryanoasis/vim-devicons'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
