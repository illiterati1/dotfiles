
---- Lsp-zero

vim.opt.signcolumn = 'yes'

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')

cmp.setup({
    float_borders = 'rounded',
    call_servers = 'local',
    configure_diagnostics = true,
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false}),
    },
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
        {name = 'nvim_lua'},
    },
    manage_nvim_cmp = {
        set_basic_mappings = true,
        set_extra_mappings = true,
        set_sources = false,
        use_luasnip = true,
        set_format = true,
        documentation_window = false,
    },
})
