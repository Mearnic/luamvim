require('config/plugins')
require('config/plugins/bufferline')
require('config/plugins/lualine')
require('config/plugins/nvimtree')

require('config/properties')
require('config/config')

local keys = require('config/keys')
keys.load_defaults()
