QPush = require("qpush")
  name: ""   # your push name
  code: ""   # your push code

QPush "miao"

QPush "miao", (err) ->
  throw err if err