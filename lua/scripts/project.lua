local dir = vim.fn.getcwd()
return {
  dir = dir,
  name = dir:match("[^/]+$"),
  npm = {
    loadScripts = function()
      local projectFile = io.open(dir .. "/package.json", "r")
      if not projectFile then
        return
      end

      local ok, projectConfig = pcall(vim.json.decode, projectFile:read("*a"))
      if not ok then
        return
      end

      return projectConfig.scripts or {}
    end,
  },
}
