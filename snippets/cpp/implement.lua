-- https://ejmastnak.com/tutorials/vim-latex/luasnip/#config
local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep
local filename = function ()
  return vim.fn.fnamemodify(vim.fn.expand('%'),':t:r')
end
return {
  s('imp',
    fmta(
      [[
        #pragma once

        class <> : public <> {
          <>
        public:
          <>
        };
      ]],
      {f(filename, {}), i(1), i(2), i(3)}
    )
  )
}
