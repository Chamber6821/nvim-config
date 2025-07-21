return {
  "folke/snacks.nvim",
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          auto_close = true,
        },
      },
      layout = {
        layout = {
          box = "vertical",
          border = "rounded",
          width = 0.8,
          height = 0.8,
          {
            box = "vertical",
            title = "{source} {live} {flags}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
          },
          { win = "preview", border = "top", height = 0.7, title = "{preview}" },
        },
      },
    },
  },
}
