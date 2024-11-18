local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

return {
  s({
    trig = 'helloworld',
    snippetType = 'snippet',
    desc = 'A hellow world snippet',
    wordTrig = true,
  }, { t "Just a hint of what's to come!" }),

  s(
    'err',
    fmt(
      [[
        if err != nil {{
          {}
        }}
      ]],
      {
        c(1, { t 'panic(err)', t 'return err' }),
      }
    )
  ),

  s(
    'fmt1',
    fmt('To {title} {} {}.', {
      i(2, 'Name'),
      i(3, 'Surname'),
      title = c(1, { t 'Mr.', t 'Ms.' }),
    })
  ),

  s(
    {
      trig = 'chi',
      desc = 'Chi webserver',
    },
    fmt(
      [[
        r := chi.NewRouter()
        r.Get("/{1}", func(w http.ResponseWriter, r *http.Request) {{
          {2}
        }}

        port := os.Getenv("PORT")
        if port == "" {{
          port = "8080"
        }}

        log.Println("Serving http://localhost:" + port)
        log.Fatal(http.ListenAndServe(":"+port, r))
    ]],
      {
        i(1),
        i(2, 'fmt.Fprintf(w, "Hello world!")'),
      }
    )
  ),

  s(
    {
      trig = 'web',
      desc = 'Webserver',
    },
    fmt(
      [[
        http.HandleFunc("/{1}", func(w http.ResponseWriter, r *http.Request) {{
          {2}
        }})

        port := os.Getenv("PORT")
        if port == "" {{
              port = "8080"
        }}
        log.Println("Serving http://localhost:" + port)
        log.Fatal(http.ListenAndServe(":"+port, nil))
    ]],
      {
        i(1),
        i(2, 'fmt.Fprintf(w, "Hello world!")'),
      }
    )
  ),

  parse(
    { trig = 'ma', name = 'Main Package', dscr = 'Basic main package structure' },
    [[
  package main

  import "fmt"

  func main() {
    fmt.Printf("%+v\n", "...")
  }
  ]]
  ),
}
