return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        icons_enabled = false,
        section_separators = "",
        component_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { right = "" },
            color = { gui = "bold" },
            fmt = function(str)
              return " " .. str
            end,
          },
        },
        lualine_b = {
          { "diff", symbols = { added = "+", modified = "~", removed = "-" } },
        },
        lualine_c = { "filename" },

        lualine_y = {
          {
            "progress",
            separator = { left = "" },
            color = { gui = "bold" },
            fmt = function(str)
              return " " .. str .. " "
            end,
          },
        },

        lualine_z = {
          {
            "location",
            separator = { left = "" },
            color = { gui = "bold" },
          },
        },
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

