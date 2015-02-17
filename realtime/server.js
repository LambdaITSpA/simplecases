/*var http = require("http");

http.createServer(function(request, response) {
  response.writeHead(200, {"Content-Type": "text/html"});
  response.write("Hola Mundo");
  response.end();
}).listen(8888);
console.log('Listening on port 8888 :)')*/
var io = require('socket.io').listen(5001),
    redis = require('redis').createClient('6379', 'localhost');

redis.subscribe('rt-change');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
  	message = JSON.parse(message)
  	channel = message.user_id+'-n'
  	console.log(channel)
    socket.emit(channel, message);
  });
});