return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      css = { "prettierd" },
      clojure = { "cljfmt" },
    },
    format_after_save = {
      lsp_format = "fallback",
    },
  },
}
