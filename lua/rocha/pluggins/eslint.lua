return {
  {
    "nvimtools/none-ls.nvim",
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
  {
    "MunifTanjim/eslint.nvim",
    name = "eslint",
    config = function()
      local has_eslint = vim.fn.findfile("*eslint*", 0, 1) ~= ""

      if not has_eslint then
        return nil
      end

      require("eslint").setup({
        bin = "eslint_d", -- "eslint" or "eslint_d"
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
          enable = false,  -- somehow diagnostics are running twice, so I'm disabling it here
          report_unused_disable_directives = false,
          run_on = "save", -- `type` or `save`
        },
      })
    end
  }
}
