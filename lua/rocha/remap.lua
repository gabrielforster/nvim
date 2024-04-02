vim.g.mapleader = " "
vim.keymap.set("n", "<leader><tab>", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-j>", vim.cmd.tabp)
vim.keymap.set("n", "<C-k>", vim.cmd.tabn)

-- go error handling remap
vim.keymap.set(
  "n",
  "<leader>ge",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc><Esc>kk"
)

vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
