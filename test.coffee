QPush = require("./index")

qpush = new QPush
  name: ""   # your push name
  code: ""   # your push code

qpush.text "miao", (err) ->
  throw err if err

qpush.url "miao", 'http://faceair.me', (err) ->
  throw err if err
