
local M = {}

-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 本地变量
local map = vim.api.nvim_set_keymap
local dmap = vim.api.nvim_del_keymap

local opt = {
  noremap = true,
  silent = true
}

local mode_types = {
  insert_mode = "i",
  normal_mode = "n",
  term_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c",

}

local generic_opts = {
  insert_mode = opt,
  normal_mode = opt,
  visual_mode = opt,
  visual_block_mode = opt,
  command_mode = opt,
  term_mode = { silent = true },
}

local defaults = {
  normal_mode= {
    ['J']='5j',
    ['K']='5k',

    ['|']='J',
    ['?']='K',

    ['n']='nzz',
    ['N']='Nzz',

    ['<']='<<',
    ['>']='>>',

    ['<A-a>']='<C-a>',
    ['<A-x>']='<C-x>',
    ['å']='<C-a>',
    ['≈']='<C-x>',
    ['<C-a>']='<HOME>',
    ['<C-e>']='<END>',

    [';']=':',
    ['<C-s>']=':w<CR>',
    ['<C-q>']=':q<CR>',

    --['<LEADER>e']= ':NvimTreeToggle<CR>',
    ['<LEADER>e']= ':NvimTreeToggle<CR><C-w>p',
    ['<LEADER>p']= ':Glow<CR>',
    ['<A-r>']= ':NvimTreeFindFile<CR>',
    ['®']= ':NvimTreeFindFile<CR>',
    ['<LEADER>v']= ':Glow<CR><C-w>|<C-w>_',
  },

  insert_mode = {
    ['<C-s>']='<ESC>:w<CR>',

    ['<C-c>']='~<ESC>u',
    ['<C-q>']='~<ESC>u',


    ['<C-a>']='<HOME>',
    ['<C-e>']='<END>',
  },
  visual_mode = {
    ['H']='M',
    ['J']='5j',
    ['K']='5k',
--   ['L']='zz',
    ['<C-s>']= '<ESC>:w<CR>',
    ['Y']= '"+y',
    ['*']= ':normal gv"+y<CR>/\\V<C-r>"<CR>',
  },

  visual_block_mode = {
    ['H']='M',
    ['J']='5j',
    ['K']='5k',
    ['L']='zz',
    ['<C-s>']='<ESC>:w<CR>',
    --['Y']='"+y',
    ['*']=':normal gv"+y<CR>/\\V<C-r>"<CR>',
  },
  command_mode = {
    ['<C-a>']='<HOME>',
    ['<C-e>']='<END>',
  }
}

function M.load_defaults()
  local keymaps = defaults or {}
  for mode, mapping in pairs(keymaps) do
    M.load_mode(mode, mapping)
  end
end

function M.load_mode(mode, mapping)
  local mode_type = mode_types[mode] or mode
  for k,v in pairs(mapping) do
    M.set_mapping(mode_type, mode, k, v)
  end
end

function M.set_mapping(mode_type, mode, key, val)
  if val then
    map(mode_type, key, val, generic_opts[mode])
  else
    dmap(mode, key)
  end
end

return M

