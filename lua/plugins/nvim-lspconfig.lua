return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
              diagnosticSeverityOverrides = {
                reportAny = "none",
              },
            },
          },
        },
      },
    },
  },
}
