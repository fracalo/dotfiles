require('fracalo.set')
require('fracalo.treesitter')
require('fracalo.remaps')
require('fracalo.packer')
require('fracalo.lsp_cmp')

local augroup = vim.api.nvim_create_augroup
fracalo = augroup('fracalo', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.o.background = "dark"
require("gruvbox").setup({
    overrides = {
        Signcolumn = {bg = "#3d3d3d"}
    }
})
vim.cmd([[colorscheme gruvbox]])


