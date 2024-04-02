return {
  "romainl/vim-cool", -- highlight only current search
  "davidgranstrom/nvim-markdown-preview",
  {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup()
    end
  },
  {
    "neoclide/coc.nvim",
    name = "coc",
    branch = "release"
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
	    require("nvim-ts-autotag").setup({})
    end
  }
}
