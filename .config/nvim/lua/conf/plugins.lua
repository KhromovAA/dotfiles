---@diagnostic disable: undefined-global
vim.cmd([[packadd packer.nvim]])

local use = require("packer").use
require("packer").startup(function()
	--libraries
	use("nvim-lua/plenary.nvim")
	--plugin management
	use("wbthomason/packer.nvim")
	--lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	--autocomplete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-git")
	--snippets
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("rafamadriz/friendly-snippets")
	--format
	use("editorconfig/editorconfig-vim")
	use("mhartington/formatter.nvim")
	--comment
	use("numToStr/Comment.nvim")
	--parser
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	--icons
	use("kyazdani42/nvim-web-devicons")
	--motion
	use("easymotion/vim-easymotion")
	--file explorer
	use("kyazdani42/nvim-tree.lua")
	--find
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	--bufferline
	use("akinsho/bufferline.nvim")
	--status
	use("nvim-lualine/lualine.nvim")
	--utils
	use("windwp/nvim-autopairs")
	use("Pocco81/AutoSave.nvim")
	use("powerman/vim-plugin-ruscmd")
	use("ethanholz/nvim-lastplace")
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	--theme
	use("navarasu/onedark.nvim")
	--rust
	use("Saecki/crates.nvim")
	--arduino
	use("stevearc/vim-arduino")
end)
