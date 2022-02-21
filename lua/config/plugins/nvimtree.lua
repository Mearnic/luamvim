
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
    side = "left",
    width = 25,
    ignore = {".git", "node_modules", ".cache"},
    auto_open = 0,
    auto_close = 0,
    quit_on_open = 0,
    follow = 1,
    indent_markers = 1,
    hide_dotfiles = 1,
    git_hl = 1,
    root_folder_modifier = ":~",
    allow_resize = 1,

    show_icons = {
        git = 1,
        folders = 1,
        files = 1
    },

    icons = {
        default = '',
        symlink = '',
        folder  = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
        },
        lsp  = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = true,
        mappings = {
            custom_only = true,
            list = list,
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },

}
