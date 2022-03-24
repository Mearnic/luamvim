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
      error = " ",
      warning = " ",
      info = " ",
      hint = " "
    },
    --icons = {
    --  hint = "",
    --  info = "",
    --  warning = "",
    --  error = "",
    --},
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

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier= ":t"
vim.g.nvim_tree_show_icons = {
  git = false,
  folders = false,
}
