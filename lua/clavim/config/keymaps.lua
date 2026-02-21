local map = vim.keymap.set

map("i", "<C-c>", "<ESC>")

map("n", "<Esc>", ":noh<CR>", { silent = true })

map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

map("n", "J", "mbJ`b")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>s", ":w<CR>", { silent = true })
map("n", "<leader>qq", ":qa<CR>", { silent = true })

map("n", "<leader><down>", "<C-w>s")
map("n", "<leader><right>", "<C-w>v")
map("n", "<left>", "<C-w>h")
map("n", "<right>", "<C-w>l")
map("n", "<up>", "<C-w>k")
map("n", "<down>", "<C-w>j")
map("n", "<leader>=", "<C-w>=")

map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')

map("n", "<leader>?", "<CMD>ClavimCheatsheet<CR>", { silent = true })

map("n", "<leader>;", function() Snacks.terminal() end)

map("n", "<leader>ll", function()
  local view = vim.fn.winsaveview()
  vim.lsp.buf.format({ async = false })
  vim.fn.winrestview(view)
end)
