local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

return {
  s({ trig = 'helloworld', snippetType = 'snippet', desc = 'A hellow world snippet', wordTrig = true }, { t "Just a hint of what's to come!" }),
}
