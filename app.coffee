moment = require 'moment'
expressjs = require 'express'
express = expressjs()
http = require('http').Server express
io = require('socket.io') http

express.use expressjs.static 'public'

express.get '/', (req, res) ->
  res.render 'index.ejs'
  console.log moment.utc().format() + ' get / served'

http.listen 3000, ->
  console.log moment.utc().format() + ' server started'

io.on 'connection', (socket) ->
  console.log moment.utc().format() + ' client connected'

  io.emit 'welcome', {}

  socket.on 'disconnect', ->
    console.log moment.utc().format() + ' client disconnected'
