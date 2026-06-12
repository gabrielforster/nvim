return {
  "williamboman/mason.nvim",
  lazy = false,
  config = function()
    require("mason").setup()

    vim.diagnostic.config({
      float = { border = "rounded" },
      virtual_text = true,
    })

    vim.lsp.enable({
      'lua_ls',
      'rust_analyzer',
      'tinymist',
      'vtsls',
      'vue_ls',
      'clangd',
      'gopls',
      'pyright',
    })
  end,
}
