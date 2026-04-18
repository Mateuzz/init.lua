return {
	{
		'williamboman/mason.nvim',
		opts = {}
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {'saghen/blink.cmp'},
		config = function()
			-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local capabilities =  require('blink.cmp').get_lsp_capabilities({})

			vim.lsp.enable('ts_ls')
			vim.lsp.enable('phptools')
			vim.lsp.enable('clangd')

			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = "Goto Definition"})
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, {desc = "Goto References"})
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {desc = "Goto Implementation"})
			vim.keymap.set('n', '<space>m', vim.diagnostic.open_float)

			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics,
				{
					virtual_text = false,
					signs = true,
					update_in_insert = false,
					underline = true,
				}
			)
			-- vim.lsp.enable('intelephense')
			--
			-- vim.lsp.config('intelephense', {
			-- 	capabilities = capabilities
			-- })
		end
	},
	{
		'rmagatti/goto-preview',
		opts = { default_mappings = true }
	},
	{
		'https://github.com/onsails/lspkind.nvim',
	},
	-- {
	-- 	'hrsh7th/cmp-buffer',
	-- },
	-- {
	-- 	'hrsh7th/cmp-path',
	-- },
	-- {
	-- 	'hrsh7th/cmp-cmdline',
	-- },
	{
		'b0o/schemastore.nvim',
	},
	{
		'L3MON4D3/LuaSnip',
		config = function()
			require("luasnip.loaders.from_snipmate").lazy_load{
				paths = "~/.local/share/nvim/plugged/vim-snippets/snippets/"
			}
		end
	},

	{
		'saghen/blink.cmp',
		-- optional: provides snippets for the snippet source
		dependencies = { 'rafamadriz/friendly-snippets' },

		-- use a release tag to download pre-built binaries
		version = '1.*',

		-- AND/OR build from source
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = 'super-tab',
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = 'mono'
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = true } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { 'lsp', 'path' },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" }
		},
		opts_extend = { "sources.default" }
	}

	-- {
	-- 	'saadparwaiz1/cmp_luasnip',
	-- },
	-- {
	-- 	'hrsh7th/cmp-nvim-lsp',
	-- 	config = function()
	-- 		for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	-- 			vim.api.nvim_set_hl(0, group, {})
	-- 		end
	-- 	end
	-- },

	-- {
	-- 	'hrsh7th/nvim-cmp',
	-- 	config = function()
	-- 		local cmp = require'cmp'
	-- 		local lspkind = require('lspkind')
	--
	--
	-- 		cmp.setup({
	-- 			formatting = {
	-- 				format = lspkind.cmp_format({
	-- 					-- mode = 'symbol', -- show only symbol annotations
	-- 					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
	-- 					ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
	-- 				})
	-- 			},
	--
	-- 			performance = {
	-- 				debounce = 30,
	-- 				throttle = 00
	-- 			},
	--
	-- 			window = {
	-- 				-- completion = cmp.config.window.bordered(),
	-- 				documentation = cmp.config.window.bordered(),
	-- 			},
	--
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				['<C-b>'] = cmp.mapping.scroll_docs(-4),
	-- 				['<C-f>'] = cmp.mapping.scroll_docs(4),
	-- 				['<C-Space>'] = cmp.mapping.complete(),
	-- 				['<C-e>'] = cmp.mapping.abort(),
	-- 				['<tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- 				['<c-j>'] = function()
	-- 					require('luasnip').jump(1)
	-- 				end,
	--
	-- 				['<c-k>'] = function()
	-- 					require('luasnip').jump(-1)
	-- 				end,
	-- 			}),
	--
	-- 			snippet = {
	-- 				expand = function(args)
	-- 					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	-- 					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	-- 					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	-- 				end,
	-- 			},
	--
	--
	-- 			sources = cmp.config.sources({
	-- 				{ name = 'nvim_lsp' },
	-- 				{ name = 'luasnip' }, -- For luasnip users.
	-- 				{ name = 'path' },
	-- 				{ name = 'buffer' },
	-- 				-- { name = 'vsnip' }, -- For vsnip users.
	-- 				-- { name = 'html-css' },
	-- 				-- { name = 'ultisnips' }, -- For ultisnips users.
	-- 				-- { name = 'snippy' }, -- For snippy users.
	-- 			})
	-- 		})
	--
	-- 		-- Set configuration for specific filetype.
	-- 		cmp.setup.filetype('gitcommit', {
	-- 			sources = cmp.config.sources({
	-- 				{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	-- 			}, {
	-- 					{ name = 'buffer' },
	-- 				})
	-- 		})
	-- 		-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	-- 		cmp.setup.cmdline({ '/', '?' }, {
	-- 			mapping = cmp.mapping.preset.cmdline(),
	-- 			sources = {
	-- 				{ name = 'buffer' }
	-- 			}
	-- 		})
	--
	-- 		cmp.setup.cmdline({ ':' }, {
	-- 			mapping = cmp.mapping.preset.cmdline(),
	-- 			sources = cmp.config.sources({
	-- 				{  name = 'cmdline' }
	-- 			}, {
	-- 					{ name = 'path' }
	-- 				})
	-- 		})
	-- 	end
	-- }
}
