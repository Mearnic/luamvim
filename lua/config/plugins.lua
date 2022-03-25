local commit = {
  bufferline = "871495d9e2dbe3314a421fd2d5e46f47de7ee537",
  lualine = "9208bae98fd5d1ab6145868a8c48bfee53c1a499",
  nvim_lsp_installer = "88e44bbbe2e03523e08f2bd3c9a954675bc438f4",
  nvim_lspconfig = "c51096481dc13193991571b7132740d762902355",
  nvim_tree = "2dfed89af7724f9e71d2fdbe3cde791a93e9b9e0",
  nvim_web_devicons = "634e26818f2bea9161b7efa76735746838971824",
  packer = "7182f0ddbca2dd6f6723633a84d47f4d26518191",
  which_key = "28d2bd129575b5e9ebddd88506601290bb2bb221",

  nvim_treesitter = "620cc936ad6b26c59bb2d888b3890bb8d06c50c7",
  nvim_ts_context_commentstring = "097df33c9ef5bbd3828105e4bee99965b758dc3f",
  --    nvim_notify = "15f52efacd169ea26b0f4070451d3ea53f98cd5a",
  luasnip = "59576a5cf28556a393eedfe38467e998288fc905",
  --    nlsp_settings = "3a3942b5d1da30e3ca0dc431aada3191c5952054",
  --    null_ls = "59067dae4bf2367eb06326e419c23353722ecbec",
  nvim_autopairs = "97e454ce9b1371373105716d196c1017394bc947",
  nvim_cmp = "d93104244c3834fbd8f3dd01da9729920e0b5fe7",
  --    nvim_dap = "c9a58267524f560112ecb6faa36ab2b5bc2f78a3",
  plenary = "563d9f6d083f0514548f2ac4ad1888326d0a1c66",
  --    popup = "b7404d35d5d3548a82149238289fa71f7f6de4ac",
  project = "cef52b8da07648b750d7f1e8fb93f12cb9482988",
  --    structlog = "6f1403a192791ff1fa7ac845a73de9e860f781f1",
  telescope = "0011b1148d3975600f5a9f0be8058cdaac4e30d9",
  telescope_fzf_native = "b8662b076175e75e6497c59f3e2799b879d7b954",
  toggleterm = "d2ceb2ca3268d09db3033b133c0ee4642e07f059",
  cmp_buffer = "f83773e2f433a923997c5faad7ea689ec24d1785",
  cmp_luasnip = "d6f837f4e8fe48eeae288e638691b91b97d1737f",
  cmp_nvim_lsp = "ebdfc204afb87f15ce3d3d3f5df0b8181443b5ba",
  cmp_path = "c5230cb439df9547294678d0f1c1465ad7989e5f",
  comment = "7365bfe9fc6dc004cc97b8977aa8129999d81bf5",
  --    dapinstall = "24923c3819a450a772bb8f675926d530e829665f",
  --    dashboard_nvim = "d82ddae95fd4dc4c3b7bbe87f09b1840fbf20ecb",
  fixcursorhold = "0e4e22d21975da60b0fd2d302285b3b603f9f71e",
  friendly_snippets = "4f6bd8eb5fbe0e45d57e732783ead2c3a01f549c",
  gitsigns = "4a2d30f5fb77750c7a42be9bb58a9cc2c6c7f31d",
  --    lua_dev = "a0ee77789d9948adce64d98700cc90cecaef88d5",
}

local configurations = {
  { 'wbthomason/packer.nvim', commit = commit.packer },
  {
    'kyazdani42/nvim-tree.lua',
    commit = commit.nvim_tree,
    requires = { 'kyazdani42/nvim-web-devicons' },
  },
  {
    'kyazdani42/nvim-web-devicons',
    commit = commit.nvim_web_devicons,
  },
  {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    commit = commit.bufferline,
  },
  {
    'nvim-lualine/lualine.nvim',
    commit = commit.lualine,
  },
  {
    'neovim/nvim-lspconfig',
    commit = commit.nvim_lspconfig
  },
  {
    'williamboman/nvim-lsp-installer',
    commit = commit.nvim_lsp_installer
  },
  {
    "folke/which-key.nvim",
    commit = commit.which_key,
  },

  { "nvim-lua/plenary.nvim", commit = commit.plenary },

  --  { "antoinemadec/FixCursorHold.nvim", commit = commit.fixcursorhold },
  {
    "nvim-telescope/telescope.nvim",
    commit = commit.telescope,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    commit = commit.nvim_treesitter,
    run = ':TSUpdate'
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    commit = commit.nvim_ts_context_commentstring,
  },
  {
    "lewis6991/gitsigns.nvim",
    commit = commit.gitsigns,
  },
  {
    "numToStr/Comment.nvim",
    commit = commit.comment,
  },
  {
    "ahmedkhalf/project.nvim",
    commit = commit.project,
  },
  {
    "akinsho/toggleterm.nvim",
    commit = commit.toggleterm,
  },

  {
    "hrsh7th/nvim-cmp",
    commit = commit.nvim_cmp,
--    config = function()
--      if lvim.builtin.cmp then
--        require("lvim.core.cmp").setup()
--      end
--    end,
    requires = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "rafamadriz/friendly-snippets",
    commit = commit.friendly_snippets,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
    commit = commit.luasnip,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = commit.cmp_nvim_lsp,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    commit = commit.cmp_luasnip,
  },
  {
    "hrsh7th/cmp-buffer",
    commit = commit.cmp_buffer,
  },
  {
    "hrsh7th/cmp-path",
    commit = commit.cmp_path,
  },

  {
    "windwp/nvim-autopairs",
    commit = commit.nvim_autopairs,
  },

}

local packer = require('packer');

packer.startup(function(use)
  for _, plugins in ipairs(configurations) do
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end
  end
end)


require('config/plugins/nvimtree')
require('config/plugins/bufferline')
require('config/plugins/lualine')
require('config/plugins/whichkey')
require('config/plugins/telescope')
require('config/plugins/treesitter')
require('config/plugins/gitsigns')
require('config/plugins/comment')
require('config/plugins/project')
require('config/plugins/toggleterm')
require("config/plugins/cmp")
-- require("luasnip/loaders/from_vscode").lazy_load()
require("config.plugins.autopairs")
