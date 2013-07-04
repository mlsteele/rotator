io = require("socket.io").listen(8044)

io.sockets.on "connection", (socket) ->
  socket.on "ping", (data) ->
    socket.emit("pong")
