return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'glepnir/zephyr-nvim'
    use 'shaunsingh/nord.nvim'
    use {
        'ellisonleao/gruvbox.nvim',
        requires = {'rktjmp/lush.nvim'}
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}

end)

