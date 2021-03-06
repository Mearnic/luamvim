require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  --  ensure_installed = "maintained",
  ensure_installed = {"html", "vue", "java", "bash", "go", "yaml", "css", "vim", "lua", "javascript", "typescript"},


  -- Install languages synchronously (only applied to `ensure_installed`)
  -- sync_install = true,
  -- 节点选择
  incremental_selection = {
    enable = true,
    keymaps = {
--      init_selection = '<CR>',
--      node_incremental = '<CR>',
--      node_decremental = '<BS>',
--      scope_incremental = '<TAB>',
    }
  },
  context_commentstring = {
    enable = true
  },

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },
  indent = {
    enable = true
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = {"lua", "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

