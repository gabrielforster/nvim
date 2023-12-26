function SetColors(color, transparent)
	color = color or "rose-pine"
	-- color = color or "gruvbox"
	-- color = color or "slate"
	-- color = color or "habamax"
	vim.cmd.colorscheme(color)

  transparent = transparent or false

  if transparent then
   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end

end

SetColors("gruvbox", true)
