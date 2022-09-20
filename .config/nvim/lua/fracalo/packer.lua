
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()

	use("wbthomason/packer.nvim")

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

end)
