vim.g.mapleader = " "
-- vim.keymap.set("n", "-", vim.cmd.Ex)     -- shadowed by vinegar

-- open config file
vim.keymap.set('n', '<leader>i', ':e $MYVIMRC<CR>', { desc = 'Go to [I]init.lua' })

vim.keymap.set('n', '<leader>e', ':Lexplore<cr> :vertical resize 30<cr>', { desc = 'Go to [E]xplorer'})
vim.keymap.set('n', '<leader>te', ':sp<cr>:term<cr>:resize 20N<cr>i', { desc = '[te]rminal'})

-- Indent whole file and jump back to last edit position
vim.keymap.set("n", "<leader>=", "ggVG=`.", { desc = '[=] Reindent file' })

-- Previous and next buffer
vim.keymap.set('n', '<leader>n', ':bn<cr>', { desc = '[n]ext buffer' })
vim.keymap.set('n', '<leader>N', ':bp<cr>', { desc = 'Previous buffer' })

vim.keymap.set('n', ']e', vim.diagnostic.goto_next, { desc = 'next error (LSP)' })
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, { desc = 'prev error (LSP)' })

vim.keymap.set('n', '<leader>h', vim.cmd.noh, { desc = 'No search [h]ighlights' })
