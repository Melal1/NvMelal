local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local NvMelalPL = {
	-- Dependencies
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",

	-- Color Schemes and icons
	-- Schemes
	"nyoom-engineering/oxocarbon.nvim",
	"lunarvim/darkplus.nvim",
	"Mofiqul/vscode.nvim",
	"Mofiqul/adwaita.nvim",
	{ "decaycs/decay.nvim", name = "decay" },
	"nyoom-engineering/oxocarbon.nvim",
	"rebelot/kanagawa.nvim",
	"morhetz/gruvbox",
	-- Icons
	"nvim-tree/nvim-web-devicons", -- some cool icons
	"NvChad/nvim-colorizer.lua",
	------------------------------------
	-- Nvim tree
	"nvim-tree/nvim-tree.lua",

	-- "" Plgugins
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"numToStr/Comment.nvim", -- Comment with gc

	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim", tag = "0.1.1" }, -- fuzzy finder
	-- "nvim-telescope/telescope-media-files.nvim",

	-- autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	"hrsh7th/cmp-cmdline", -- cmdline completions

	-- snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets

	-- lsp
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfg

	-- configure lsp
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion

	{
		"glepnir/lspsaga.nvim", --
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	-- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" }, -- autoclose tags

	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},

	-- Indent Guides
	"lukas-reineke/indent-blankline.nvim",

	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	"akinsho/toggleterm.nvim",
	-- Bufferline
	"akinsho/bufferline.nvim",

	-- my theme switcher
	-- "Melal1/nvim-theme-switcher",
	-- Telescope extension maker
	-- "adoyle-h/telescope-extension-maker.nvim",
	-- Discoed Status
	-- "andweeb/presence.nvim",
	-- Project
	"ahmedkhalf/project.nvim",
	-- Bookmarks
	"kkharji/sqlite.lua", -- Deb to get Bookmarks works with firefox
	"dhruvmanila/browser-bookmarks.nvim",
	-- zoxide
	"jvgrootveld/telescope-zoxide",
	-- Telescope repo
	"cljoly/telescope-repo.nvim",
	-- command pallate
	"LinArcX/telescope-command-palette.nvim",
	-- file browser telescope
	"nvim-telescope/telescope-file-browser.nvim",
	-- Session manager
	{
		"olimorris/persisted.nvim",
		config = true,
	},
	-- HOP --{for fast move}
	{
		"phaazon/hop.nvim",
		branch = "v2",
	},
	-- Buffer switcher
	"matbme/JABS.nvim",
	-- notifyer
	"rcarriga/nvim-notify",
	-- color picker
	"ziontee113/color-picker.nvim",
	-- T ODO plugin
	"folke/todo-comments.nvim",
}
local opts = {}

require("lazy").setup(NvMelalPL, opts)
