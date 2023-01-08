
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()

	use("wbthomason/packer.nvim")
    --use("nvim-telescope/telescope-file-browser.nvim")
    use {'nvim-tree/nvim-tree.lua',
    requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' }-- optional, updated every week. (see issue #1193)

	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
	requires = {
		{'nvim-lua/plenary.nvim'}
	}}


	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate"
	})
    use("nvim-treesitter/nvim-treesitter-context")

	-- lodash of vim?
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})
	use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
	use( "ellisonleao/gruvbox.nvim" )

    use("neovim/nvim-lspconfig")

    -- todo, setup cmp
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')

    use('lewis6991/gitsigns.nvim')


    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-cmdline')

    use('mfussenegger/nvim-dap')
    use('leoluz/nvim-dap-go')
    use('rcarriga/nvim-dap-ui')
    use('theHamsta/nvim-dap-virtual-text')
    use('nvim-telescope/telescope-dap.nvim')

end)
