(($) ->
  $ ->
    console.log 'DOM is ready'

  socketio = io()

  socketio.on 'connection', (socket) ->
    console.log 'socket is ready'

  socketio.on 'times', (message, callback) ->
    $('#times_losangeles').text message.losangeles
    $('#times_newyork').text message.newyork
    $('#times_utc').text message.utc
    $('#times_london').text message.london
    $('#times_prague').text message.prague
    $('#times_istanbul').text message.istanbul
    $('#times_tokyo').text message.tokyo
    callback(true);

) jQuery
