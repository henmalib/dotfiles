local opt = vim.opt

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

opt.termguicolors = true

opt.number = true
opt.relativenumber = true

opt.backup = false
opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.wrap = false
opt.scrolloff = 8

opt.updatetime = 250

opt.colorcolumn = "80"
opt.smartindent = true

vim.opt.spelllang = 'en_us,uk'
vim.opt.spell = true
