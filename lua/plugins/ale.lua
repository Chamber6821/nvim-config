return {
  'dense-analysis/ale',
  config = function()
    local g = vim.g
    g.ale_lint_on_save = true
    g.ale_linters = {
      javascript = {'eslint'},
      javascriptreact = {'eslint'},
      typescript = {'eslint'},
      typescriptreact = {'eslint'},
    }
    g.ale_fix_on_save = true
    g.ale_fixers = {
      javascript = {'eslint'},
      javascriptreact = {'eslint'},
      typescript = {'eslint'},
      typescriptreact = {'eslint'},
   }
  end
}
