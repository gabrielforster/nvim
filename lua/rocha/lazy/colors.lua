function SetColors(color, bg)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    if bg then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

function Gruvbox()
    local color = "gruvbox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = {
                    background = false,
                },
                disable_background = true,
            })

            vim.cmd("colorscheme rose-pine")

            SetColors()
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup()
        end
    },
    {
        "folke/tokyonight.nvim",
        config = function ()
            require("tokyonight").setup({
                style = "night",
                transparent = false,
                italics = {
                    comments = true,
                    keywords = true,
                    functions = true,
                    strings = true,
                    variables = true,
                },
            })

            SetColors("tokyonight", true)
        end,
        name = "tokyonight",
        lazy = false,
        priority = 1000,
        opts = {},
    }
}
