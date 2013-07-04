log = -> console.log.apply console, arguments
plantTimeout  = (ms, cb) -> setTimeout  cb, ms
plantInterval = (ms, cb) -> setInterval cb, ms

io = require("socket.io").listen(8044)

rotation =
  theta: 0
  rvel: 0.5

plantInterval 100, ->
  rotation.theta += rotation.rvel
  rotation.theta = rotation.theta % 360

io.sockets.on "connection", (socket) ->
  socket.on 'rotation.subscribe', ->
    plantInterval 100, ->
      socket.emit "rotation.update",
        rotation: rotation

  socket.on 'rotation.ask', ->
    socket.emit "rotation.update",
      rotation: rotation

  socket.on 'rotation.update', (data) ->
    rotation.rvel = data.rvel
