local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	execute("packadd packer.nvim")
end

return require("packer").startup(function(use)
	-- Packer itself
	use("wbthomason/packer.nvim")
	-- Colorscheme
	use({ "Mofiqul/dracula.nvim", requires = { "xiyaowong/nvim-transparent" } })
	-- Buffer utilities
	use("akinsho/nvim-bufferline.lua")
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- File tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-media-files.nvim",
			},
		},
	})
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"kabouzeid/nvim-lspinstall",
			"glepnir/lspsaga.nvim",
			"onsails/lspkind-nvim",
			"kosayoda/nvim-lightbulb",
			{ "michaelb/sniprun", run = "bash ./install.sh" },
		},
	})
	-- Project Management
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})
	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			{
				"hrsh7th/vim-vsnip",
				requires = {
					"hrsh7th/cmp-vsnip",
					"rafamadriz/friendly-snippets",
					"hrsh7th/vim-vsnip-integ",
					"golang/vscode-go",
				},
			},
			"mattn/emmet-vim",
		},
	})
	-- Text tools
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"p00f/nvim-ts-rainbow",
			"windwp/nvim-ts-autotag",
			"norcalli/nvim-colorizer.lua",
			"terrortylor/nvim-comment",
			"edluffy/specs.nvim",
			"rktjmp/highlight-current-n.nvim",
		},
	})
	-- Formatting
	use({ "mhartington/formatter.nvim", requires = { "windwp/nvim-autopairs" } })
	-- Git integrations
	use("lewis6991/gitsigns.nvim")
	-- Discord
	use("andweeb/presence.nvim")
	-- Live server
	use("turbio/bracey.vim")
end)
