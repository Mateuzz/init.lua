return {
	'nvim-treesitter/nvim-treesitter',

	dependencies = { 'https://github.com/nvim-lua/plenary.nvim'},
	lazy = false,
	build = "TSUpdate",

	config = function ()
		require('nvim-treesitter.configs').setup{
			additional_vim_regex_highlighting = true,
			indent = {
				enable = true
			},
			highlight = {
				enable = true
			}
		}
	end,
}
