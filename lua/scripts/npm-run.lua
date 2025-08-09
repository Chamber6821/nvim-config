local fun = require("lib.fun")
local utils = require("lib.utils")

local projectDir = vim.fn.getcwd()
local projectFilename = projectDir .. "/package.json"
local projectName = projectDir:match("[^/]+$")

local function loadScripts()
  local projectFile = io.open(projectFilename, "r")
  if not projectFile then
    return
  end

  local ok, projectConfig = pcall(vim.json.decode, projectFile:read("*a"))
  if not ok then
    return
  end

  return projectConfig.scripts or {}
end

local function run(scriptName)
  os.execute("tmux new -d -s '" .. projectName .. " " .. scriptName .. "' '" .. "npm run " .. scriptName .. "'")
end

vim.api.nvim_create_user_command("NpmRun", function()
  Snacks.picker.pick({
    source = "npm_scripts",
    finder = function()
      local scripts = loadScripts() or {}
      local nameColWidth = fun.max(fun.chain(fun.map(fun.length, fun.map(utils.first, scripts)), { 0 }))
      local items = utils.reduce_to_table(fun.map(function(name, script)
        return { name = name, text = utils.pad.right(name, " ", nameColWidth) .. " " .. script }
      end, scripts))
      table.sort(items, function(a, b)
        return a.name < b.name
      end)
      return items
    end,
    format = "text",
    layout = {
      layout = {
        title = "Run script in tmux",
        title_pos = "left",
        box = "vertical",
        border = "rounded",
        width = 0.8,
        height = 0.8,
        { win = "input", height = 1, border = "bottom" },
        { win = "list", border = "none" },
      },
    },
    confirm = function(picker, item)
      picker:close()
      run(item.name)
    end,
  })
end, {})
