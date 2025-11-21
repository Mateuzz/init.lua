return {
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
		keyset('n', '<space>z', telescope.extensions.zoxide.list, { desc = 'Telescope Old Files ' })
	end
}
