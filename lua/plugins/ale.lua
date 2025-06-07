vim.env.ESLINT_D_PPID = vim.fn.getpid()
vim.g.ale_javascript_eslint_executable = 'eslint_d'
vim.g.ale_javascript_eslint_use_global = 1
return {
  'dense-analysis/ale',
  config = function()
    local g = vim.g
    local eslint = 'eslint'
    g.ale_lint_on_save = true
    g.ale_linters = {
      javascript = {eslint},
      javascriptreact = {eslint},
      typescript = {eslint},
      typescriptreact = {eslint},
      css = {eslint},
    }
    g.ale_fix_on_save = true
    g.ale_fixers = {
      javascript = {eslint},
      javascriptreact = {eslint},
      typescript = {eslint},
      typescriptreact = {eslint},
      css = {eslint},
   }
  end
}
