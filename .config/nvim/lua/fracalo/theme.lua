
vim.o.background = "dark"
require("gruvbox").setup({
    overrides = {
        Signcolumn = {bg = "#3d3d3d"}
    }
})
vim.cmd([[colorscheme gruvbox]])
