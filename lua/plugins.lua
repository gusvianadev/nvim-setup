local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- Packer itself
    use 'wbthomason/packer.nvim'
    -- Lua guide
    use 'nanotee/nvim-lua-guide'
    -- Colorscheme
    use 'glepnir/oceanic-material'
    -- File management
	use 'akinsho/nvim-bufferline.lua'
    use 'vim-airline/vim-airline'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-media-files.nvim' }
    }
    -- LSP and completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/nvim-compe'
    -- Text utilities
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', requires = {'nvim-treesitter/playground', 'p00f/nvim-ts-rainbow'} }
    use 'norcalli/nvim-colorizer.lua'
    use 'windwp/nvim-autopairs'
    -- Git integrations
    use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
    use 'TimUntersberger/neogit'
end)
