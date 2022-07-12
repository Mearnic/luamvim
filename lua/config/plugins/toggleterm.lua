
local open_flag = false
local init_flag = false
local Terminal  = require('toggleterm.terminal').Terminal
local toggle_item = require("toggleterm")
toggle_item.setup{
  -- size can be a number or function which is passed the current terminal
--  size = 20 | function(term)
--    if term.direction == "horizontal" then
--      return 15
--    elseif term.direction == "vertical" then
--      return vim.o.columns * 0.4
--    end
--  end,
--  open_mapping = [[†]],

  on_open = function(term)
--    if open_flag then
--      return
--    end
    init_flag = true
    open_flag = true
  end,
--  --  on_open = fun(t: Terminal), -- function to run when the terminal opens
--  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  on_close = function(term)
    init_flag = false
    open_flag = false
  end,
  --  on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
  --  on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
  --  on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = false,
  direction = 'float',-- | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'double', -- | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    --width = <value>,
    --height = <value>,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    -- vim.api.nvim_set_keymap("n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    open_flag = true
    init_flag = true
  end,
  on_close = function(term)
    init_flag = false
    open_flag = false
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("t", "†", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
----vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
---- vim.api.nvim_set_keymap("n", "†", "<cmd>lua _ls_toggle()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", {noremap = true, silent = true})
--
function set_terminal_keymaps()
  vim.api.nvim_set_keymap('t', '<C-q>', [[<C-\><C-n>]], {noremap = true, silent = true})
end
--  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
----  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
----  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
----  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
----  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
--
--
local winf = Terminal:new({
--  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "curved",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_set_keymap("n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    open_flag = true
  end,
  on_close = function(term)
    open_flag = false
  end,
})

function _winf_toggle()
--    if not init_flag then
--      vim.api.nvim_command("ToggleTerm")
--      vim.api.nvim_command("ToggleTerm")
--    end
  if not init_flag then
--    if not init_flag then
--      vim.api.nvim_command("ToggleTerm")
--      vim.api.nvim_command("ToggleTerm")
--    end
    winf:toggle()
  end
end


local win = Terminal:new({
--  cmd = "lazygit",
  dir = "git_dir",
  direction = "horizontal",
  size = 10,
  close_on_exit = true,
  float_opts = {
    border = "curved",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_set_keymap("n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
})

function _win_toggle()
  if not open_flag then
--    if not init_flag then
--      vim.api.nvim_command("ToggleTerm")
--      vim.api.nvim_command("ToggleTerm")
--    end
    win:toggle()
  end
end
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>exe v:count1 . 'ToggleTerm'<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<F4>", "<cmd>exe v:count1 . 'ToggleTerm'<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<F4>", "<cmd>exe v:count1 . 'ToggleTerm'<CR>a", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<A-t>", "<cmd>lua _win_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<A-t>", "<cmd>lua _win_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<A-t>", "<cmd>lua _win_toggle()<CR>a", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua _winf_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<C-t>", "<cmd>lua _winf_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-t>", "<cmd>lua _winf_toggle()<CR>a", {noremap = true, silent = true})
