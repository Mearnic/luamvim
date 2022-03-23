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
    disabled_filetypes = {},
    always_divide_middle = true
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {
    },
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}, symbols = {error = " ", warn = " ", info = " ", hint = " "}},
      "encoding",
    },
    lualine_y = {},
    lualine_z = {"progress"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


