-- return {
-- 	'nvim-treesitter/nvim-treesitter',
-- 	build = ":TSUpdate",
-- 	lazy = false,
-- 	config = function ()
-- 		local map = { 'cpp', 'c', 'php', 'javascript', 'typescript', 'vue', 'jsx', 'html', 'css', 'blade' }
--
-- 		require('nvim-treesitter').install = map
--
-- 		vim.api.nvim_create_autocmd('FileType', {
-- 		  pattern = map,
-- 		  callback = function() vim.treesitter.start() end,
-- 		})
--
-- 		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- 		vim.wo[0][0].foldmethod = 'expr'
-- 		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 	end
-- 	--
-- 	-- config = function ()
-- 	-- 	require('nvim-treesitter.config').setup{
-- 	-- 		additional_vim_regex_highlighting = true,
-- 	-- 		indent = {
-- 	-- 			enable = true
-- 	-- 		},
-- 	-- 		highlight = {
-- 	-- 			enable = true
-- 	-- 		}
-- 	-- 	}
-- 	-- end,
-- }

return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter",
    -- build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      local highlight = function(bufnr, lang)
        -------------------[ destaques do treesitter ]-------------------------------
        if not vim.treesitter.language.add(lang) then
          return vim.notify(
            string.format("Treesitter não consegue carregar o parser para a linguagem: %s", lang),
            vim.log.levels.INFO,
            { title = "Treesitter" }
          )
        end
        vim.treesitter.start(bufnr)
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo.filetype
          local bt = vim.bo.buftype
          local buf = args.buf

          if bt ~= "" then
            return
          end -- não executar mais.

          local ok, treesitter = pcall(require, "nvim-treesitter")
          if not ok then
            return
          end

          --------------------[ dobras do treesitter ]-------------------------------

          -- if ft == "javascriptreact" or ft == "typescriptreact" then
          --   vim.opt_local.foldmethod = "indent"
          -- else
          --   vim.opt_local.foldmethod = "expr"
          --   vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          -- end
          --
          -- vim.schedule(function()
          --   -- Execute normalmente apenas se não estivermos em modo terminal
          --   if vim.fn.mode() ~= "t" then
          --     vim.cmd "silent! normal! zx"
          --   end
          -- end)

          ---------------------[ indentações do treesitter ]-------------------------------

          if not vim.tbl_contains({ "python", "html", "yaml", "markdown", "cpp", "c" }, ft) then
            vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
          end

          --------------------[ parsers do treesitter ]-------------------------------
          -- if vim.fn.executable "tree-sitter" ~= 1 then
          --   vim.api.nvim_echo({
          --     {
          --       "CLI do tree-sitter não encontrado. Parsers não podem ser instalados.",
          --       "ErrorMsg",
          --     },
          --   }, true, {})
          --   return false
          -- end

          if not vim.treesitter.language.get_lang(ft) then
            return
          end

          if vim.list_contains(treesitter.get_installed(), ft) then
            highlight(buf, ft)
          elseif vim.list_contains(treesitter.get_available(), ft) then
            treesitter.install(ft):await(function()
              highlight(buf, ft)
            end)
          end
        end,
      })
    end,
    opts = {
      install = {
        "css",
        "comment",
        "markdown",
        "markdown_inline",
		"php",
		"javascript",
		"typescript",
		"cpp",
		"c",
		"html",
		"vue",
        "regex",
        "vimdoc",
		"jsx",
		"tsx",
		"lua",
		"sql",
		"json",
		"yaml",
		"dockerfile",
      },
    },
    config = function(_, opts)
      local treesitter = require "nvim-treesitter"
      treesitter.setup(opts)
      -- if vim.fn.executable "tree-sitter" ~= 1 then
      --   vim.api.nvim_echo({
      --     {
      --       "CLI do tree-sitter não encontrado. Parsers não podem ser instalados.",
      --       "ErrorMsg",
      --     },
      --   }, true, {})
      --   return false
      -- end
      treesitter.install(opts.install)
    end,
  }
