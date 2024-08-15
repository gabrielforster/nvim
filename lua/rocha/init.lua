require("rocha.remap")
require("rocha.set")

require("rocha.lazy_init")

local function setupMaps(opts)
    -- lsp related maps
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

    vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')

    -- dap related maps
    -- vim.keymap.set("n", "<leader>dbp", "<cmd> DapToggleBreakpoint<CR>", opts)
    -- vim.keymp.set("n", "<leader>dr", "<cmd> DapContinue<CR>", opts)
end

local augroup = vim.api.nvim_create_augroup
local RochaGroup = augroup("Rocha", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
end

vim.filetype.add({
    extension = {
        templ = "templ",
    }
})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40
        })
    end
})

autocmd({ "BufWritePre" }, {
    group = RochaGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
    group = RochaGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        setupMaps(opts)
    end
})

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
