return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "jcha0713/cmp-tw2css",
    "hrsh7th/nvim-cmp",
  },

  config = function()
    vim.diagnostic.config({
      float = { border = "rounded" }
    })

    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "tinymist",
      },

      handlers = {
        function(server_name) -- default handler (optional)
          if server_name == "tsserver" then
            server_name = "ts_ls"
          end
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        ["clangd"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.clangd.setup {
            capabilities = { capabilities, offsetEncoding = { "utf-16" } }
          }
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      }
    })

    local l = vim.lsp
    l.handlers["textDocument/hover"] = function(_, result, ctx, config)
      config = config or { border = "rounded", focusable = true }
      config.focus_id = ctx.method
      if not (result and result.contents) then
        return
      end
      local markdown_lines = l.util.convert_input_to_markdown_lines(result.contents)
      markdown_lines = vim.tbl_filter(function(line)
        return line ~= ""
      end, markdown_lines)
      if vim.tbl_isempty(markdown_lines) then
        return
      end
      return l.util.open_floating_preview(markdown_lines, "markdown", config)
    end

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    vim.api.nvim_set_hl(0, "CmpNromal", {})
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<Enter>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      window = {
        completion = {
          scrollbar = false,
          border = "rounded",
          winhighlight = "Normal:CmpNromal",
        },
        documentation = {
          scrollbar = false,
          border = "rounded",
          winhighlight = "Normal:CmpNromal",
        }
      },
      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          entry_filter = function(entry, ctx)
            print(entry)
            return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
          end,
        },
        {
          name = "cmp-tw2css"
        }
      }, {})
    })
  end
}
