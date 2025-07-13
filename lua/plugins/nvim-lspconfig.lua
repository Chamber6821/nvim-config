return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        -- Отключаем форматирование через возможности сервера
        capabilities = {
          documentFormattingProvider = false,
          documentRangeFormattingProvider = false,
        },
        -- Отключаем автоформатирование при сохранении
        on_attach = function(client, bufnr)
          -- Оставляем остальные LSP-фичи, но отключаем форматирование
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      },
    },
  },
}
