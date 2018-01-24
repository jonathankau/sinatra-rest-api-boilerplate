require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/param'
require 'json'

class App < Sinatra::Base
  helpers Sinatra::Param

  before do
    content_type :json
  end

  get '/' do
    param :sample_param, String, required: false

    { test: 'hello_world' }.to_json
  end

  get '/submit/:text' do
    { test: params['text'] }.to_json
  end

  get '/error' do
    halt 400, { error: 'not found' }.to_json
  end

  run! if app_file == $0
end
