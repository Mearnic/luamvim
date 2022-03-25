local status, lualine = pcall(require, "lualine")
if (not status) then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = {left = "", right = ""},
    section_separators = {left = "", right = ""},
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true
  },
  sections = {
    lualine_a = {
      "mode"
    },
    lualine_b = {
      "filename",
    },
    lualine_c = {
      "diff",
      {
        "diagnostics",
        sources = {"nvim_lsp"},
        --      symbols = {error = " ", warn = " ", info = " ", hint = ""}
        symbols = {
          error = " ",
          warning = " ",
          info = " ",
          hint = " "
        }
      },
    },
    lualine_x = {
    },
    lualine_y = {
      "progress",
      {
        "fileformat",
        symbols = {
          unix = "",
          dos = "",
          mac = "",
        },
      },
      "encoding",
    },
    lualine_z = {
      {
        "branch",
        icons_enabled = true,
        icon = { " " },
      },
    },
  },
  inactive_sections = {
    lualine_a = {
    },
    lualine_b = {
    },
    lualine_c = {
      {
        "fileformat",
        symbols = {
          unix = "",
          dos = "",
          mac = "",
        },
      },
      "encoding",
      "filename",
      "location",
      "progress",
    },
    lualine_x = {
      {
        "diagnostics",
        sources = {"nvim_lsp"},
        symbols = {
          error = " ",
          warning = " ",
          info = " ",
          hint = " "
        }
      },
      "diff",
    },
    lualine_y = {
    },
    lualine_z = {}
  },
  tabline = {},
  extensions = { "nvim-tree" }
}


