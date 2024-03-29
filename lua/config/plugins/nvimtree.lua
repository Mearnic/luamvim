local M = {}

-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
--  local list = {
--   { key = {"<CR>", "<2-LeftMouse>"},          cb = tree_cb("edit") },
--   { key = {"<C-g>"},                          cb = tree_cb("cd") },
--   { key = "E",                                cb = tree_cb("vsplit") },
--   { key = "V",                                cb = tree_cb("split") },
--   { key = "T",                                cb = tree_cb("tabnew") },
--   { key = "<",                                cb = tree_cb("prev_sibling") },
--   { key = ">",                                cb = tree_cb("next_sibling") },
--   { key = "P",                                cb = tree_cb("parent_node") },
--   { key = "h",                                cb = tree_cb("close_node") },
--   --{ key = "l",                                cb = tree_cb("open_node") },
--   { key = "l",                                cb = tree_cb("preview") },
--   { key = "h",                                cb = tree_cb("Close Director") },
--   { key = "<Tab>",                            cb = tree_cb("preview") },
--   { key = "<C-k>",                            cb = tree_cb("first_sibling") },
--   { key = "<C-j>",                            cb = tree_cb("last_sibling") },
--   { key = "I",                                cb = tree_cb("toggle_ignored") },
--   { key = "H",                                cb = tree_cb("toggle_dotfiles") },
--   { key = "R",                                cb = tree_cb("refresh") },
--   { key = "n",                                cb = tree_cb("create") },
--   { key = "d",                                cb = tree_cb("remove") },
--   { key = "D",                                cb = tree_cb("trash") },
--   { key = "r",                                cb = tree_cb("rename") },
--   { key = "<C-r>",                            cb = tree_cb("full_rename") },
--   { key = "<C-x>",                            cb = tree_cb("cut") },
--   { key = "<C-c>",                            cb = tree_cb("copy") },
--   { key = "<C-v>",                            cb = tree_cb("paste") },
--   { key = "y",                                cb = tree_cb("copy_name") },
--   { key = "yy",                               cb = tree_cb("copy_path") },
--   { key = "Y",                                cb = tree_cb("copy_absolute_path") },
--   { key = "<c-p>",                            cb = tree_cb("prev_git_item") },
--   { key = "<c-n>",                            cb = tree_cb("next_git_item") },
--   { key = "-",                                cb = tree_cb("dir_up") },
--   { key = "s",                                cb = tree_cb("system_open") },
--   { key = "?",                                cb = tree_cb("toggle_help") },
--   -- { key = "q",                            cb = tree_cb("close") },
-- }

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  --on_attach = my_on_attach,
  --open_on_setup = false,
  --ignore_buffer_on_setup = true,
  --ignore_ft_on_setup = {
  --  "startify",
  --  "dashboard",
  --  "alpha",
  --},
  auto_reload_on_write = true,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  --update_to_buf_dir = {
  --  enable = true,
  --  auto_open = true,
  --},
  --auto_close = false,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
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
    width = 40,
  --  height = 30,
    hide_root_folder = false,
    side = "left",
  -- auto_resize = false,
  --  mappings = {
  --    custom_only = false,
  --    list = list,
  --  },
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
--    window_picker = {
--      enable = false,
--      chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
--      exclude = {},
--    },
  },


}

local a = vim.api


local function find_rogue_buffer()
  for _, v in ipairs(a.nvim_list_bufs()) do
    if vim.fn.bufname(v) == "NvimTree" then
      return v
    end
  end
  return nil
end

local function _wipe_rogue_buffer()
  local bn = find_rogue_buffer()
  if bn then
    local win_ids = vim.fn.win_findbuf(bn)
    for _, id in ipairs(win_ids) do
      if vim.fn.win_gettype(id) ~= "autocmd" then
        a.nvim_win_close(id, true)
      end
    end
    -- Do not use `nvim_buf_delete` here as it throws an uncacthable error if
    -- the buffer is in an autocmd window.
    a.nvim_command("silent! bw " .. bn)
  end
end

function M.buffer_distinct()
  local bufnr = a.nvim_create_buf(false, false)

  if not pcall(a.nvim_buf_set_name, bufnr, 'NvimTree') then
    _wipe_rogue_buffer()
    a.nvim_buf_set_name(bufnr, 'NvimTree')
  end
end

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

--  api.config.mappings.deault_on_attach(bufnr)
  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<C-g>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'E', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'V', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'T', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', 'l', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', '<C-k>', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', '<C-j>', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'n', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-x>', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', '<C-c>', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', '<C-v>', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'yy', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'Y', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', '<c-p>', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', '<c-n>', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

end

require("nvim-tree").setup({
  ---
  on_attach = my_on_attach,
  ---
})

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier= ":t"
vim.g.nvim_tree_show_icons = {
  git = false,
  folders = false,
}


-- lua
vim.g.nvim_tree_respect_buf_cwd = 0


  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
--  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
--  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
--  vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
--  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
--  vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
--  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
--  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
--  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
--  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
--  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
--  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
--  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
--  vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
--  vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
--  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
--  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
--  vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
--  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
--  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
--  vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
--  vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
--  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
--  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
--  vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
--  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
--  vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
--  vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
--  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
--  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
--  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
--  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
--  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
--  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
--  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
--  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
--  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
--  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
--  vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
--  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
--  vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
--  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
--  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
--  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
--  vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
--  vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
--  vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
--  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
--  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
--  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
--  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
--  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
--  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH

