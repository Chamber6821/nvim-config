return {
  'dense-analysis/ale',
  config = function()
    local g = vim.g
    g.ale_lint_on_save = true
    g.ale_linters = {
      javascript = {'standard'},
      javascriptreact = {'standard'},
      cpp = {},
    }
    g.ale_fix_on_save = true
    g.ale_fixers = {
      javascript = {'standard'},
      javascriptreact = {'standard'},
      cpp = {},
   }
  end
}
