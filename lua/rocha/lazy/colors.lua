function SetColors(color)
  color = color or "rose-pine"
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
}

