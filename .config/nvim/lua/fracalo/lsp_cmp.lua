
-- lsp
-------------
-- typescript

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
--
local on_attach = function (client, buf)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0, desc = 'go to definition'})
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer = 0})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = 0})
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, {buffer = 0, noremap=true})
    -- diagnostics
    vim.keymap.set('n', '<leader>df', vim.diagnostic.get_next, {buffer = 0})
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.get_prev, {buffer = 0})
    -- telescope integrations
    vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>", {buffer = 0})
    vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", {buffer = 0})
end

require'lspconfig'.tsserver.setup {
    on_attach = on_attach,
}
-------------
-- lua
require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-------------
-- go
require'lspconfig'.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}




-------------
-- cmp
vim.opt.completeopt={'menu', 'menuone', 'noselect'}
local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})
