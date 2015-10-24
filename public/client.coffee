(($) ->
  $ ->
    console.log 'DOM is ready'

  socketio = io()

  socketio.on 'connection', (socket) ->
    console.log 'socket is ready'

  socketio.on 'welcome', (message, callback) ->
    callback(true);

) jQuery
