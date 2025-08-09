-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.filetype sets to vifm filetype
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = "vifmrc", command = "set filetype=vim" })

vim.filetype.add({
  pattern = {
    ["%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
  },
})

local project = require("scripts.project")
local function findShadowWatchTarget()
  local output = io.popen(
    "ps aux | grep -E '"
      .. project.name
      .. "/node_modules\\S*shadow-cljs\\S*\\s+watch' | awk '{print $NF}' | tr -d '\\n:'"
  )
  if output == nil then
    return nil
  end
  local target = output:read("*a")
  if #target == 0 then
    return nil
  end
  return target
end

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = "*.cljs",
  callback = function()
    local target = findShadowWatchTarget()
    if target == nil then
      vim.print("Shadow watch target not found")
    end
    vim.cmd("ConjureShadowSelect " .. target)
  end,
})
