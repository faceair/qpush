request = require "request"

module.exports = (account) ->
  return (message, callback) ->
    {name, code} = account
    request.post
      url: "https://qpush.me/pusher/push_site/"
      form:
        name: name
        code: code
        "msg[text]": message
        cache: "true"
    , (err, res, body) ->
      if callback
        return callback new Error 'ServerError' if err
        try
          body = JSON.parse body
        catch e
          return callback new Error 'ServerError'
        callback if body.error then new Error body.error else null