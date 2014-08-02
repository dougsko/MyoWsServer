require 'sinatra'
require 'faye/websocket'
require 'json'

# run with: foreman start

Faye::WebSocket.load_adapter('thin')

@clients = []
App = lambda do |env|
  if Faye::WebSocket.websocket?(env)
    ws = Faye::WebSocket.new(env)
    @clients << ws

    ws.on :open do |e|
      puts "websocket connection open"
    end

    ws.on :message do |msg|
        puts "received msg: " + msg.data
        everyone_else = @clients.select{ |client| client != ws}
        everyone_else.each do |client|
            client.send(msg.data.to_json)
        end
    end

    ws.on :close do |event|
      puts "websocket connection closed"
      @clients.delete(ws)
      ws = nil
    end

    ws.rack_response
  else
    if env["REQUEST_PATH"] == "/"
        [200, {}, File.read('./index.html')]
    elsif env["REQUEST_PATH"] == "/pong"
        [200, {}, File.read('./pong.html')]
    else
        [404, {}, '']
    end
  end
end
