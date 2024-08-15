vim.opt.backspace = '2' -- 'indent,eol,start'
vim.opt.showcmd = true
vim.opt.laststatus = 2  -- always
vim.opt.autoread = true	-- load file changes from outside vim

-- vim.opt.timeoutlen = 500     -- maybe uncomment once the commands are familiar
vim.opt.updatetime = 50

-- Screen lines to keep above and below cursor
vim.opt.scrolloff = 8

vim.opt.number = true   -- line numbers
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.opt.colorcolumn = '80,120'

-- Only one at a time should be on
vim.opt.cindent = true
vim.opt.smartindent = false
vim.opt.autoindent = false
----------------------------------

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.wrap = true

vim.opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂,eol:⁋'

vim.opt.clipboard = 'unnamed,unnamedplus'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.undofile = true
vim.opt.swapfile = true
vim.opt.directory = vim.fn.stdpath('data') .. 'tmp'
vim.opt.undodir = vim.fn.stdpath('data') .. 'undo'

vim.opt.history = 1000  -- command line history

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tags = ".tags"

vim.opt.mouse = 'a'

-- vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'None' })

-- vim.g['netrw_banner'] = 0
vim.g['netrw_liststyle'] = 0
-- vim.g['netrw_winsize'] = 25
