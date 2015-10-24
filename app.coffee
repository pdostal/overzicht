moment = require 'moment'
cron = require('cron').CronJob
expressjs = require 'express'
express = expressjs()
http = require('http').Server express
io = require('socket.io') http

express.use expressjs.static 'public'

express.get '/', (req, res) ->
  res.render 'index.ejs'
  console.log moment.utc().format() + ' get / served'

format = 'YYYY/MM/DD, hh:mm:ss a z Z'
new cron '* * * * * *', () ->
  data = {
    losangeles: moment.tz('America/Los_Angeles').format(format)
    newyork: moment.tz('America/New_York').format(format)
    utc: moment.tz('utc').format(format)
    london: moment.tz('Europe/London').format(format)
    prague: moment.tz('Europe/Prague').format(format)
    istanbul: moment.tz('Europe/Istanbul').format(format)
    tokyo: moment.tz('Asia/Tokyo').format(format)
  }
  io.emit 'times', data
, null, true

port = process.env.PORT || 8000
http.listen port, ->
  console.log moment.utc().format() + ' server started on port ' + port

io.on 'connection', (socket) ->
  console.log moment.utc().format() + ' client connected'

  io.emit 'welcome', {}

  socket.on 'disconnect', ->
    console.log moment.utc().format() + ' client disconnected'
