request = require 'request'

module.exports = class Qpush
  constructor: ({@name, @code}) ->

  _push: (form, callback) ->
    request.post
      url: 'https://qpush.me/pusher/push_site/'
      form: form
    , (err, res, body) ->
      if callback
        return callback new Error 'ServerError' if err
        try
          body = JSON.parse body
        catch e
          return callback new Error 'ServerError'
        callback if body and body.error then new Error body.error else null

  text: (message, callback) =>
    @_push
      name: @name
      code: @code
      "msg[text]": message
    , callback

  url: (title, url, callback) =>
    @_push
      name: @name
      code: @code
      'msg[text]': url
      'msg[type]': 'url'
      'msg[extra][title]': title
    , callback
