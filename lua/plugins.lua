local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath( "data" ) ..
                         "/site/pack/packer/start/packer.nvim"

if fn.empty( fn.glob( install_path ) ) > 0 then
    fn.system( {
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    } )
    execute "packadd packer.nvim"
end

return require( "packer" ).startup( function( use )
    -- Packer itself
    use "wbthomason/packer.nvim"
    -- Plenary the most important plugins need it
    use "nvim-lua/plenary.nvim"
    -- Lua guide
    use "nanotee/nvim-lua-guide"
    -- Colorscheme
    use "glepnir/oceanic-material"
    -- Buffer utilities
    use "akinsho/nvim-bufferline.lua"
    use "vim-airline/vim-airline"
    -- File tree
    use {
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" }
    }
    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-media-files.nvim"
        }
    }
    -- LSP
    use {
        "neovim/nvim-lspconfig",
        requires = { "glepnir/lspsaga.nvim", "onsails/lspkind-nvim" }
    }
    -- Completion
    use {
        "hrsh7th/nvim-compe",
        requires = { "hrsh7th/vim-vsnip", "hrsh7th/vim-vsnip-integ" }
    }
    -- Text utilities
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "nvim-treesitter/playground",
            "p00f/nvim-ts-rainbow",
            "windwp/nvim-ts-autotag",
            "norcalli/nvim-colorizer.lua",
            "windwp/nvim-autopairs"
        }
    }
    -- Formatting
    use "mhartington/formatter.nvim"
    -- Git integrations
    use { "TimUntersberger/neogit", requires = { "lewis6991/gitsigns.nvim" } }
end )
