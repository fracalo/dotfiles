-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

--vim.keymap.setnmap('<leader>w', ':w<CR>', { desc = 'Save with ease' })
vim.keymap.set('n', '<leader>w', ':echo "you mama"', { desc = 'Save with ease' })

vim.keymap.set('n', '<leader>T', ':enew<cr>', { desc = 'To open a new empty buffer' })

vim.keymap.set('n', '<leader>l', ':bnext<CR>', { desc = 'Move next buffer' })

vim.keymap.set('n', '<leader>h', ':bprevious<CR>', { desc = 'Move prev buffer' })

vim.keymap.set('n', '<leader>bq', ':bp <BAR> bd #<CR>', { desc = 'Close a buf' })
