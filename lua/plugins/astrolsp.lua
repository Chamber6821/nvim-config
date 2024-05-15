return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable: missing-fields
    config = {
      clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    formatting = {
      filter = function(client)
        if (vim.bo.filetype == "java") then
          return client.name == "jdtls"
        end
        return true
      end
    },
  },
}
