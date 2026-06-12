return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "vimdoc", "javascript", "typescript", "c", "lua", "rust",
      "jsdoc", "bash", "go", "python", "json", "yaml", "toml", "html",
    },
    sync_install = false,
    auto_install = true,
    indent = { enable = true },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
    vim.treesitter.language.register("templ", "templ")
  end,
}
