return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    name = "null-ls"
  },
  {
    "MunifTanjim/eslint.nvim",
    name = "eslint",
    config = function()
      require("eslint").setup({
        bin = 'eslint',
        code_actions = {
          enable = true,
          apply_on_save = {
            enable = true,
            types = { "directive", "problem", "suggestion", "layout" },
          },

          disable_rule_comment = {
            enable = true,
            location = "separate_line", -- or `same_line`
          },
        },
        diagnostics = {
          enable = false, -- somehow diagnostics are running twice, so I'm disabling it here
          report_unused_disable_directives = false,
          run_on = "type", -- or `save`
        },
      })
    end
  }
}

