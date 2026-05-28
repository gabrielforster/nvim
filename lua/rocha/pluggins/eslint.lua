return {
  {
    "nvimtools/none-ls.nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim"
    },
    name = "null-ls",
    config = function()
      require("null-ls").setup({
        sources = {
          require("none-ls.formatting.eslint_d"),
          require("none-ls.diagnostics.eslint_d"),
          require("none-ls.code_actions.eslint_d"),
        },
      })
    end
  },
}
