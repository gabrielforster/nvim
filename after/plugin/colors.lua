function SetColors(color)
 -- moonfly, darkplus, catppuccin, github, github_dark, github_dark_dimmed, github_dark_high_contrast
	color = color or "github_dark_high_contrast"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColors()
