return {
	{
		'https://github.com/neogitorg/neogit',
		lazy = true,
		cmd = 'Neogit',
		keys = {
			{ "<space>1", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
		}
	},
	{
		'https://github.com/tpope/vim-fugitive'
	},
	{
		'https://github.com/sindrets/diffview.nvim',
		keys = {
			{ "<space>2", "<cmd>DiffviewOpen<cr>", desc = "Show Diff View" },
			{ "<space>3", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
		}
	},
}
