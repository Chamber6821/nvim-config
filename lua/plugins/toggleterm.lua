vim.keymap.set({ "n", "t" }, "<F7>", "<cmd>ToggleTerm direction=float<cr>")
return {
  "akinsho/toggleterm.nvim",
  version = "v2.*",
  opts = {
    float_opts = {
      border = "curved",
    },
  },
}
