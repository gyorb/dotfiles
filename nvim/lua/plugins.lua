
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'rafamadriz/friendly-snippets'
  use {'jose-elias-alvarez/null-ls.nvim', -- formatters and linters
    requires = {'nvim-lua/plenary.nvim'},
  }

  -- FZF
  use { 'junegunn/fzf.vim',
    requires = { 'junegunn/fzf' },
  }

  -- telescope
  use { 'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  }

  -- Git
  use { 'lewis6991/gitsigns.nvim', -- git added/removed in sidebar + inline blame
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Theme
  use 'nanotech/jellybeans.vim'
  use 'NLKNguyen/papercolor-theme'
  use 'tomasiser/vim-code-dark'
  use 'jacoborus/tender.vim'
end)

