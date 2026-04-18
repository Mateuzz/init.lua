return {
	{
		'nvim-lua/plenary.nvim',
	},
	{
		'https://github.com/tpope/vim-surround',
	},
	{
		'https://github.com/mattn/emmet-vim',
	},
	-- {
	-- 	'https://github.com/MagicDuck/grug-far.nvim'
	-- },
	{
		'nvim-pack/nvim-spectre',
		config = function()
			vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
				desc = "Toggle Spectre"
			})
			vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
				desc = "Search current word"
			})
			vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
				desc = "Search current word"
			})
			vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
				desc = "Search on current file"
			})
		end
	},
	{
		'https://github.com/puremourning/vimspector',
		config = function()
			vim.g.vimspector_enable_mappings = 'HUMAN'
			local key = vim.keymap.set

			key('n', '<leader>ro', '<cmd>VimspectorReset<cr>')

			vim.cmd [[
				nmap <Leader>di <Plug>VimspectorBalloonEval
				xmap <Leader>di <Plug>VimspectorBalloonEval
			]]
		end
	},
	-- {
	-- 	'https://github.com/nvim-neo-tree/neo-tree.nvim',
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		'https://github.com/MunifTanjim/nui.nvim',
	-- 		'https://github.com/nvim-lua/plenary.nvim'
	-- 	},
	-- 	keys = {
	-- 		{ '<c-n>', '<cmd>Neotree toggle position=left<CR>' },
	-- 		{ '<c-m>', '<cmd>Neotree position=current<CR>' },
	-- 	},
	-- 	opts = {
	-- 		filesystem = {
	-- 			window = {
	-- 				position = 'current'
	-- 			}
	-- 		}
	-- 	},
	-- },
	{
		'https://github.com/mbbill/undotree'
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
		lazy = false,
		opts = {
			disable_netrw = true,
			diagnostics = {
				enable = true,
			}
		},
		keys = {
			{ '<c-n>', '<cmd>NvimTreeToggle<CR>' },
			{ '<c-m>', '<cmd>NvimTreeToggle %:h<CR>' },
			{ '<c-,>', '<cmd>NvimTreeFocus <CR>' },
			{ '<c-ç>', "<cmd> lua require('nvim-tree.api').tree.toggle({current_window = true})<CR>" },
		}
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			messages = {
				view_search = false
			}
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		}
	},
	{
		"LunarVim/bigfile.nvim",
		opts = {
			filesize = 3, -- size of the file in MiB, the plugin round file sizes to the closest MiB
			pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
			features = { -- features to disable
				"indent_blankline",
				"illuminate",
				"lsp",
				"treesitter",
				"syntax",
				"matchparen",
				"vimopts",
				"filetype",
			},
		}
	},
	{
		"cappyzawa/trim.nvim",
		opts = {
			trim_on_write = true,
			highlight = false,
		}
	}
	-- {
	-- 	"ThePrimeagen/harpoon",
	-- 	branch = "harpoon2",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		local harpoon = require('harpoon')
	-- 		harpoon:setup()
	-- 		vim.keymap.set("n", "<c-,>", function() harpoon:list():add() end)
	-- 		vim.keymap.set("n", "<c-.>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
	-- 	end
	-- },
}
