vim.cmd("set cmdheight=1")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.g.copilot_enabled = 0
vim.opt.nu = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = " " }
vim.highlight.priorities.semantic_tokens = 94
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.guicursor = "n:block-Cursor"
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>f", ":%s/")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
