vim.env.ESLINT_D_PPID = vim.fn.getpid()
vim.g.ale_javascript_eslint_executable = "eslint_d"
vim.g.ale_javascript_eslint_use_global = 1

return {
  "dense-analysis/ale",
  config = function()
    -- https://github.com/dense-analysis/ale/blob/9fe7b1fe6a23fb55e6d782293585d58193123f59/ale_linters/javascript/eslint.vim
    vim.fn["ale#linter#Define"]("css", {
      name = "eslint",
      output_stream = "both",
      executable = vim.fn["ale#handlers#eslint#GetExecutable"],
      cwd = vim.fn["ale#handlers#eslint#GetCwd"],
      command = vim.fn["ale#handlers#eslint#GetCommand"],
      callback = "ale#handlers#eslint#HandleJSON",
    })

    local g = vim.g
    local eslint = "eslint"
    g.ale_lint_on_save = true
    g.ale_linters = {
      javascript = { eslint },
      javascriptreact = { eslint },
      typescript = { eslint },
      typescriptreact = { eslint },
      css = { eslint },
    }
    g.ale_fix_on_save = true
    g.ale_fixers = {
      javascript = { eslint },
      javascriptreact = { eslint },
      typescript = { eslint },
      typescriptreact = { eslint },
    }
  end,
}
