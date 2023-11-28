function SetColors(color)
	-- color = color or "rose-pine"
	color = color or "gruvbox"
	-- color = color or "slate"
	-- color = color or "habamax"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
SetColors()
