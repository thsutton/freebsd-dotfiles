local opts = { noremap = true, silent = true }

local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, opts)

vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', opts)

local tree = require('nvim-tree')
vim.keymap.set('n', '<leader>xt', function() tree.toggle(false, true) end, opts)
