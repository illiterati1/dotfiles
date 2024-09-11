vim.g.mapleader = " "
-- vim.keymap.set("n", "-", vim.cmd.Ex)     -- shadowed by vinegar

vim.keymap.set('n', '<leader>te', ':sp<cr>:term<cr>:resize 20N<cr>i', { desc = '[te]rminal'})

-- Indent whole file and jump back to last edit position
vim.keymap.set("n", "<leader>=", "ggVG=`.", { desc = '[=] Reindent file' })

-- Previous and next buffer
vim.keymap.set('n', '<leader>n', ':bn<cr>', { desc = '[n]ext buffer' })
vim.keymap.set('n', '<leader>N', ':bp<cr>', { desc = 'Previous buffer' })

vim.keymap.set('n', ']e', vim.diagnostic.goto_next, { desc = 'next error (LSP)' })
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, { desc = 'prev error (LSP)' })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating (error) text' })
