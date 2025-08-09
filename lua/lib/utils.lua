local fun = require("lib.fun")
return {
  first = function(x)
    return x
  end,
  second = function(_, x)
    return x
  end,
  pad = {
    left = function(str, filler, length)
      return string.rep(filler, (length - #str) / #filler) .. str
    end,
    right = function(str, filler, length)
      return str .. string.rep(filler, (length - #str) / #filler)
    end,
  },
  reduce_to_table = function(gen)
    local tbl = {}
    fun.each(function(x)
      table.insert(tbl, x)
    end, gen)
    return tbl
  end,
}
