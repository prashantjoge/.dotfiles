local fn = vim.fn
-- Automatically install packer
--test
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff  to comment gc
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")
	use("nathom/filetype.nvim")
	use("rcarriga/nvim-notify")
	-- vim auto sessions
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "info",
				auto_session_suppress_dirs = { "~/", "~/Projects" },
			})
		end,
	})
	--	use("gelguy/wilder.nvim") -- A more adventurous wild menu
	--use "roxma/vim-hug-neovim-rpc"
	--use("roxma/nvim-yarp")
	use("romgrk/fzy-lua-native")
	use("nixprime/cpsm")
	use("sharkdp/fd")
	-- auto_save
	use("Pocco81/AutoSave.nvim")
	-- Colorschemes
	use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out
	use("lunarvim/darkplus.nvim")
	use("folke/tokyonight.nvim")
	use("folke/trouble.nvim")
	--  use "richtan/pywal.vim"
	--  use 'rktjmp/lush.nvim'
	use("EdenEast/nightfox.nvim")
	--use("emacs-grammarly/lsp-grammarly") --creates huge lsp logfiles and does not work well with large files (>5000 words)
	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"f3fora/cmp-nuspell",
		rocks = { "lua-nuspell" },
	})
	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- spellcheck
	--  use {
	--  'lewis6991/spellsitter.nvim',
	-- config = function()
	--    require('spellsitter').setup{
	--      enable = true,
	--      spellchecker = 'vimfn',
	--      }
	--    end
	--  }
	-- Word Processing
	use("f3fora/cmp-spell")
	use("uga-rosa/cmp-dictionary")
	use("rudism/telescope-dict.nvim")
	use("vigoux/LanguageTool.nvim")
	use("rhysd/vim-grammarous")
	use({
		"brymer-meneses/grammar-guard.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/nvim-lsp-installer",
		},
	})
	use("dkarter/bullets.vim") -- for bullets and numbered lists
	use("folke/zen-mode.nvim") --Distraction free writing
	use("folke/twilight.nvim")
	use("vimwiki/vimwiki")
	use("reedes/vim-pencil")
	--has syntax error
	use("mickael-menu/zk-nvim") --Neovim extension for the zk plain text note-taking assistant.
	--use("dvdsk/prosesitter")
	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	--use "onsails/lspkind-nvim"
	-- Bullets Does not work
	--  use {'nvim-orgmode/orgmode', config = function()
	--        require('orgmode').setup{}
	-- end
	-- }
	--  use {
	--      "akinsho/org-bullets.nvim",
	--        config = function()
	--        require("org-bullets").setup {
	--        symbols = { "◉", "○", "✸", "✿" }
	--    -- or a function that receives the defaults and returns a list
	--    --    symbols = function(default_list)
	--    --    table.insert(default_list, "♥")
	--    --    return default_list
	--    --    end
	--    }
	--  end
	--  }
	--
	-- Telescope
	--use("BurntSushi/ripgrep")
	use("nvim-telescope/telescope-symbols.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("sudormrfbin/cheatsheet.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("jvgrootveld/telescope-zoxide")
	use("cljoly/telescope-repo.nvim")
	-- Treesitter
	use({

		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("p00f/nvim-ts-rainbow")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
