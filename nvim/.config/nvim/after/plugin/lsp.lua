
---- lsp.lua 

---- lsp-zero
vim.opt.signcolumn = 'yes'
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.skip_server_setup('rust_analyzer')

lsp.setup()

---- rust-tools
local rt = require('rust-tools')

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr})
      vim.keymap.set("n", "<S-Space>", rt.hover_actions.hover_actions, { buffer = bufnr})
    end
  },
})

---- cmp
local cmp = require('cmp')

cmp.setup({
  float_borders = 'rounded',
  call_servers = 'local',
  -- configure_diagnostics = true,
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'nvim_lsp_signature_help'},
    {name = 'nvim_lua'},
    {name = 'luasnip'},
    {name = 'buffer'},
    {name = 'calc'},
    {name = 'path'},
    {name = 'git'},
    {name = 'orgmode'},
  },
  manage_nvim_cmp = {
    set_basic_mappings = true,
    set_extra_mappings = true,
    set_sources = false,
    use_luasnip = true,
    set_format = true,
    documentation_window = true,
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

