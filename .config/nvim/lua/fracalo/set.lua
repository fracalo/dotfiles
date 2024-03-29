vim.g.mapleader = " "

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true


vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.cmdheight = 1
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- indents
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Don't pass messages to |ins-completion-menu|.
-- vim.opt.shortmess:append("c")
vim.opt.colorcolumn = "90"

vim.opt.shortmess= "atI"

-- additional conf in the directory where we open a project (.nvimrc)
vim.opt.exrc = true

vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.smartcase = true

vim.opt.scrolloff = 8
