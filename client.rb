#!/usr/bin/env ruby

require 'faye/websocket'
require 'eventmachine'
require 'json'

EM.run {
  ws = Faye::WebSocket::Client.new('ws://localhost:5000')

  ws.on :open do |event|
    p [:open]
    ws.send('Hello, world!')
    timer = EM.add_periodic_timer(1) do
        begin
          ws.send(Time.now.to_s.to_json)
        rescue NoMethodError
          EM.cancel_timer(timer)
        end
      end
  end

  ws.on :message do |event|
    p [:echo_message, event.data]
  end

  ws.on :close do |event|
    p [:close, event.code, event.reason]
    ws = nil
  end

}
