MyoWsServer
===========

# Myo Websocket Server

This server listens for connections from the [MyoWsClient](https://github.com/dougsko/MyoWsClient) and echos the received data to any other websocket client.

This server is built using the [Faye](https://github.com/faye/faye-websocket-ruby) WebSocket implementation.

# Demo

Compile and run the [MyoWsClient](https://github.com/dougsko/MyoWsClient), then browse to the [demo server](http://myo-ws-server.herkuapp.com).

# Protocol

The data echoed by the server should be compatible with the [myodaemon OSX app](https://github.com/thalmic-alpha/myodaemon).

```json
{ "frame": 
  { "id": 27361, 
    "timestamp": 1407043448, 
    "rssi": 0, 
    "euler": [ -1.180228, 0.119293, -0.202672 ], 
    "rotation_w": [ 5, 9, 8 ], 
    "accel": [ -0.11084, -0.902832, 0.364746 ], 
    "gyro": [ -0.9375, 0.1875, 0.5625 ], 
    "rotation": [ -0.547607, 0.105469, -0.050903, 0.828491 ], 
    "pose": "rest", 
    "arm": 0 
  } 
}
```

# Running

``` bash
bundle install
foreman start
```

# Running on Heroku

``` bash
heroku create
heroku labs:enable websockets
git push heroku master
heroku open
```
