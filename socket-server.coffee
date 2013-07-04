log = -> console.log.apply console, arguments
plantTimeout  = (ms, cb) -> setTimeout  cb, ms
plantInterval = (ms, cb) -> setInterval cb, ms

io = require("socket.io").listen(8044)

rotation = 0

plantInterval 100, ->
  rotation += 0.5
  rotaion = rotaion % 360

io.sockets.on "connection", (socket) ->
  socket.on 'rotation.subscribe', ->
    plantInterval 100, ->
      socket.emit "rotation.update",
        rotation: rotation

  socket.on 'rotation.ask', ->
    socket.emit "rotation.update",
      rotation: rotation

  socket.on 'rotation.update', (data) ->
    rotation = data.rotation
