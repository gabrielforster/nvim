return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        name = "null-ls",
        config = function()
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.eslint,
                    require("null-ls").builtins.diagnostics.eslint,
                    require("null-ls").builtins.code_actions.eslint,
                },
            })
        end
    },
    {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        name = "lsp-ts-utils"
    },
    {
        "MunifTanjim/eslint.nvim",
        name = "eslint",
        config = function()
            require("eslint").setup({
                bin = "eslint", -- "eslint" or "eslint_d"
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
                    run_on = "save", -- `type` or `save`
                },
            })
        end
    }
}
