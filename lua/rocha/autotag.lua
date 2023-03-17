local options = {
  auto_install = true,
  ensure_installed = {
    "lua",
    "vim",
    "go",
    "toml",
    "css",
    "tsx",
    "css",
    "html",
    "lua",
    "astro"
  },
  autotag = {
    enable = true,
    filetypes = {
      'html', 'astro', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
      'css', 'lua', 'xml', 'php', 'markdown'
    },
  },
  indent = { enable = true },
}

require('nvim-treesitter.configs').setup(options)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)
