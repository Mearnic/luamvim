
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = {"<CR>", "<2-LeftMouse>"},          cb = tree_cb("edit") },
  { key = {"<C-g>"},                          cb = tree_cb("cd") },
  { key = "E",                                cb = tree_cb("vsplit") },
  { key = "V",                                cb = tree_cb("split") },
  { key = "T",                                cb = tree_cb("tabnew") },
  { key = "<",                                cb = tree_cb("prev_sibling") },
  { key = ">",                                cb = tree_cb("next_sibling") },
  { key = "P",                                cb = tree_cb("parent_node") },
  { key = "h",                                cb = tree_cb("close_node") },
  { key = "l",                                cb = tree_cb("open_node") },
  { key = "<Tab>",                            cb = tree_cb("preview") },
  { key = "<C-k>",                            cb = tree_cb("first_sibling") },
  { key = "<C-j>",                            cb = tree_cb("last_sibling") },
  { key = "I",                                cb = tree_cb("toggle_ignored") },
  { key = "H",                                cb = tree_cb("toggle_dotfiles") },
  { key = "R",                                cb = tree_cb("refresh") },
  { key = "n",                                cb = tree_cb("create") },
  { key = "d",                                cb = tree_cb("remove") },
  { key = "D",                                cb = tree_cb("trash") },
  { key = "r",                                cb = tree_cb("rename") },
  { key = "<C-r>",                            cb = tree_cb("full_rename") },
  { key = "<C-x>",                            cb = tree_cb("cut") },
  { key = "<C-c>",                            cb = tree_cb("copy") },
  { key = "<C-v>",                            cb = tree_cb("paste") },
  { key = "y",                                cb = tree_cb("copy_name") },
  { key = "yy",                               cb = tree_cb("copy_path") },
  { key = "Y",                                cb = tree_cb("copy_absolute_path") },
  { key = "<c-p>",                            cb = tree_cb("prev_git_item") },
  { key = "<c-n>",                            cb = tree_cb("next_git_item") },
  { key = "-",                                cb = tree_cb("dir_up") },
  { key = "s",                                cb = tree_cb("system_open") },
  { key = "?",                                cb = tree_cb("toggle_help") },
  -- { key = "q",                            cb = tree_cb("close") },
}

--require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
--auto_close = false,
--auto_reload_on_write = true,
--disable_netrw = false,
--hide_root_folder = false,
--hijack_cursor = false,
--hijack_netrw = true,
--hijack_unnamed_buffer_when_opening = false,
--ignore_buffer_on_setup = false,
--open_on_setup = false,
--open_on_tab = false,
--sort_by = "name",
--update_cwd = false,
--view = {
--  hide_root_folder = true,
--  auto_resize = true,
--  mappings = {
--    custom_only = true,
--    list = list,
--  },
--  width = 30,
--  height = 30,
--  side = "left",
--  preserve_window_proportions = false,
--  number = false,
--  relativenumber = false,
--  signcolumn = "yes",
--},
--hijack_directories = {
--  enable = true,
--  auto_open = true,
--},
--update_focused_file = {
--  enable = false,
--  update_cwd = false,
--  ignore_list = {},
--},
--ignore_ft_on_setup = {},
--system_open = {
--  cmd = nil,
--  args = {},
--},
--diagnostics = {
--  enable = false,
--  show_on_dirs = false,
--  icons = {
--    hint = "",
--    info = "",
--    warning = "",
--    error = "",
--  },
--},
--filters = {
--  dotfiles = false,
--  custom = {},
--  exclude = {},
--},
--git = {
--  enable = true,
--  ignore = true,
--  timeout = 400,
--},
--actions = {
--  change_dir = {
--    enable = true,
--    global = false,
--  },
--  open_file = {
--    quit_on_open = false,
--    resize_window = false,
--    window_picker = {
--      enable = true,
--      chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
--      exclude = {
--        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
--        buftype = { "nofile", "terminal", "help" },
--      },
--    },
--  },
--},
--trash = {
--  cmd = "trash",
--  require_confirm = true,
--},
--log = {
--  enable = false,
--  truncate = false,
--  types = {
--    all = false,
--    config = false,
--    git = false,
--  },
--},
--}
require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  auto_reload_on_write = true,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  auto_close = false,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 200,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = list,
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules", ".cache" },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    },
    window_picker = {
      enable = false,
      chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      exclude = {},
    },
  },
}

--local function on_open()
-- -- require("bufferline.state").set_offset(31, "")
--end
--
--local function on_close()
--  -- require("bufferline.state").set_offset(0)
--end
--
--local tree_view = require "nvim-tree.view"
--local default_open = tree_view.open
--local default_close = tree_view.close
--
--tree_view.open = function()
--  on_open()
--  default_open()
--end
--
--tree_view.close = function()
--  on_close()
--  default_close()
--end

