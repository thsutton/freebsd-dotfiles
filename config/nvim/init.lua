if vim.g.neovide then
		vim.g.guifont = "DejaVu Sans Mono:h16"
		vim.g.neovide_scale_factor = 1.0
end

vim.g.mapleader = ","
vim.g.maplocalleader = " "

require "thsutton.plugins"

require "thsutton.mappings"
