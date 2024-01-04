vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager

  use 'romainl/vim-cool' -- Highlight only current search

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

  use {
    'lewis6991/gitsigns.nvim',
  }

	use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use("nvim-treesitter/nvim-treesitter-context", { run = ':TSUpdate' });

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

  -- Auto pairs and auto tags
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
    "windwp/nvim-ts-autotag",
    config = function() require('nvim-ts-autotag').setup() end
  }

  use 'ThePrimeagen/vim-be-good'

  -- Makes easy to comment and uncomment code
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup {
        options = {
          theme = "base16",
          -- section_separators = { "", "" },
          -- component_separators = { "", "" },
          section_separators = { "" },
          component_separators = { "" },
          icons_enabled = true,
        },
      }
    end
  }
  -- Appearance
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use 'nvim-tree/nvim-web-devicons'
  use('morhetz/gruvbox')

end)
