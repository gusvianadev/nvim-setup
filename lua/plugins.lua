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
    --
    use 'glepnir/oceanic-material'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-media-files.nvim' }
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'vim-airline/vim-airline'
    use 'norcalli/nvim-colorizer.lua'
end)