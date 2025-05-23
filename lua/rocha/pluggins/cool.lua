return {
  "romainl/vim-cool", -- highlight only current search
  "davidgranstrom/nvim-markdown-preview",
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
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  }
}
