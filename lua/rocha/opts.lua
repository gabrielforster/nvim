local function setupMaps(opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)

    vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
end

local augroup = vim.api.nvim_create_augroup
local RochaGroup = augroup("Rocha", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

vim.filetype.add({
    extension = {
        templ = "templ",
    }
})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.hl.on_yank({
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
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, e.buf, { autotrigger = true })
        end

        local opts = { buf = e.buf }
        setupMaps(opts)
    end
})

vim.keymap.set('i', '<C-Space>', function()
    vim.lsp.completion.get()
end)

vim.keymap.set('i', '<C-y>', function()
    if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ 'selected' }).selected == -1 then
        return '<C-n><C-y>'
    end
    return '<C-y>'
end, { expr = true })

vim.keymap.set({ 'i', 's' }, '<C-J>', function()
    if vim.snippet.active({ direction = 1 }) then
        vim.snippet.jump(1)
    end
end)

vim.keymap.set({ 'i', 's' }, '<C-K>', function()
    if vim.snippet.active({ direction = -1 }) then
        vim.snippet.jump(-1)
    end
end)
