return {
	{
		'https://github.com/Raimondi/delimitMate'
	},
	{
		'https://github.com/tpope/vim-surround',
	},
	{
		'https://github.com/mattn/emmet-vim'
	},
	{
		'https://github.com/nvim-telescope/telescope.nvim',
		dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },

		config = function()
			local telescope = require('telescope')

			telescope.setup({
				extensions = {
					zoxide = {
						prompt_title = "[ Walking on the shoulders of TJ ]",
						mappings = {
							default = {
								after_action = function(selection)
									print("Update to (" .. selection.z_score .. ") " .. selection.path)
								end
							},
							["<C-s>"] = {
								before_action = function(selection) print("before C-s") end,

								action = function(selection)
									vim.cmd.edit(selection.path)
								end
							},
							-- Opens the selected entry in a new split
							["<C-q>"] = { action = require('telescope._extensions.zoxide.utils').create_basic_command("split") },
						},
					}
				}
			})

			telescope.load_extension('zoxide')

			local key = require('telescope.builtin')
			local keyset = vim.keymap.set

			keyset('n', '<space>f', function() key.find_files({ no_ignore = true }) end, { desc = 'Telescope Find Files ' })
			keyset('n', '<space>r', key.live_grep, { desc = 'Telescope Live Grep ' })
			keyset('n', '<space>g', key.git_files, { desc = 'Telescope Git Files ' })
			keyset('n', '<space>u', key.oldfiles, { desc = 'Telescope Old Files ' })
			keyset('n', '<space>z', telescope.extensions.zoxide.list, { desc = 'Telescope Zoxide' })

		end
	},
	{
		'https://github.com/MagicDuck/grug-far.nvim'
	},
	{
		'https://github.com/justinmk/vim-sneak'
	},
	{
		'jvgrootveld/telescope-zoxide',
		dependencies = {
			'nvim-lua/popup.nvim'
		}
	},
	{
		'https://github.com/puremourning/vimspector'
	},
	{
		'https://github.com/Mateuzz/dark-obsidian.vim',
		config = function()
			vim.cmd [[colorscheme rust]]
		end
	},
	{
		'https://github.com/mbbill/undotree'
	},
	{
		'https://github.com/tpope/vim-fugitive'
	},
	{
		'https://github.com/sindrets/diffview.nvim'
	},
	{
		'https://github.com/lewis6991/gitsigns.nvim',
		config = function()
			local keyset = vim.keymap.set
			keyset('n', '<leader>gl', '<cmd>Gitsigns toggle_linehl<cr>')
			keyset('n', '<leader>gd ', '<cmd>Gitsigns toggle_deleted<cr>')
			keyset('n', '<leader>gw', '<cmd>Gitsigns toggle_word_diff<cr>')
			keyset('n', '<leader>gs', '<cmd>Gitsigns toggle_signs<cr>')
		end
	},
	{
		'https://github.com/honza/vim-snippets'
	},
	{
		'nvim-tree/nvim-web-devicons'
	},
	{
		'https://github.com/nvim-tree/nvim-tree.lua',
		opts = {},
		keys = {
			{'<c-n>', '<cmd>NvimTreeToggle<CR>'}
		}
	},
	{
		'https://github.com/ThePrimeagen/harpoon',
		branch = 'harpoon2',
		config = function()
			local harpoon = require("harpoon").setup()
			vim.keymap.set("n", "<space>m", function() harpoon:list():add() end)
			vim.keymap.set("n", "<space>y", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		end
	}
}
