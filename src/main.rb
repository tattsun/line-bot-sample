require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'
require 'json'

require_relative './config'

class LineBot < Sinatra::Base
  BOTAPI_ENDPOINT_HOST = "https://trialbot-api.line.me"

  def initialize
    super
    @config = Config.new
  end

  get '/' do
    'Linebot'
  end

  post '/callback' do
    data = JSON.parse(request.body.read)
    data["result"].each do |mes|
      mid = mes["from"]
      text = mes["text"]

      json = {
        to: [mid],
        toChannel: 1383378250,
        eventType: "138311608800106203",
        content: {
          contentType: 1,
          toType: 1,
          text: "SAY: #{text}"
        }
      }

      uri = URI.parse("#{BOTAPI_ENDPOINT_HOST}/v1/events")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      req = Net::HTTP::Post.new(uri.request_uri)
      req.body = JSON.dump(json)
      req["Content-Type"] = "application/json; charset=UTF-8"
      req["X-Line-ChannelID"] = @config["channel_id"]
      req["X-Line-ChannelSecret"] = @config["channel_secret"]
      req["X-Line-Trusted-User-With-ACL"] = @config["channel_mid"]

      https.request(req)
    end

    "ok"
  end
end
