return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = { 'https://github.com/nvim-lua/plenary.nvim'},
	config = function ()
		vim.cmd[[TSEnable highlight]]
	end,
	opts = {
		additional_vim_regex_highlighting = true,
	}
}
