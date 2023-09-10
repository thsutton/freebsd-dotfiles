vim.g.mapleader = ','
vim.g.maplocalleader = ' '
vim.o.backspace = 'indent,eol,start'
vim.o.backup = false
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.cursorcolumn = false
vim.o.cursorline = false
vim.o.errorbells = false
vim.o.expandtab = true
vim.o.foldmethod = 'marker'
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.joinspaces = false
vim.o.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = false
vim.o.scrolloff = 15
vim.o.shiftwidth = 4
vim.o.showmode = true
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.softtabstop = 4
vim.o.spell = true
vim.o.spelllang = 'en_au'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.syntax = 'on'
vim.o.tabstop = 8
vim.o.termguicolors = true
-- vim.o.textcolumn = "80,90,100"
vim.o.title = true
vim.o.undodir = vim.fn.stdpath('state') .. '/undodir'
vim.o.undofile = true
vim.o.wrap = false

vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.swapfile = false

if vim.g.neovide then
	vim.g.guifont = "DejaVu Sans Mono:h16"
	vim.g.neovide_scale_factor = 1.0
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.wo.colorcolumn = "80,90,100"
        vim.bo.textwidth = 80
    end
})
