# Myo Websocket Server

A tiny demo using the [Faye](https://github.com/faye/faye-websocket-ruby) WebSocket implementation.

This server accepts connections from the MyoWsClient application,
and any other application that wants to consume the Myo's data.

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
