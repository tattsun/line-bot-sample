require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'
require 'json'

class LineBot < Sinatra::Base
  get '/' do
    'Linebot'
  end

  post '/callback' do
    data = JSON.parse(request.body.read)
    p data
  end
end
