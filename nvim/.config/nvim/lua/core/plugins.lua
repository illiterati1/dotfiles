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
  } -- provides programming base conversions

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

  -- use 'tpope/vim-tbone'           -- tmux

  use 'tpope/vim-vinegar'         -- netrw enhancement

  use 'airblade/vim-gitgutter'

  use 'vim-test/vim-test'

  -- use 'folke/trouble'        -- MSVC style error list box

  -- status/command line enhancement
  use {
    'vim-airline/vim-airline',
    config = function () vim.g.airline_powerline_fonts = 1 end
  }
  -- use 'bling/vim-bufferline'
  -- use 'lambdalisue/battery.vim'

  use { 'VonHeikemen/lsp-zero.nvim',
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
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
      {'hrsh7th/cmp-nvim-lua'},
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-calc'},
      {'hrsh7th/cmp-path'},
      -- {'FelipeLema/cmp-async-path'},
      {'petertriho/cmp-git',
      config = function () require('cmp_git').setup() end },
      {'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
        local cmp = require('cmp')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end },
    }
  }

  use { 'simrat39/rust-tools.nvim',
    requires = {
      {'mfussenegger/nvim-dap'},
    },
  }
  -- use 'mfussenegger/nvim-lint'
  -- use 'mhartington/formatter.nvim'

  use {
    'j-hui/fidget.nvim',
    config = function () require('fidget').setup() end,
    tag = "legacy"
  }

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- default
      }
    end
  }

  use 'ryanoasis/vim-devicons' -- best loaded after other stuff

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
