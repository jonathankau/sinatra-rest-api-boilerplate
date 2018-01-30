require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/param'
require 'json'

class App < Sinatra::Base
  helpers Sinatra::Param

  set :show_exceptions, :after_handler

  before do
    content_type :json
  end

  get '/' do
    param :sample_param, String, required: false

    { hello: 'world' }.to_json
  end

  get '/error' do
    halt 400, { error: 'not found' }.to_json
  end

  error ActiveRecord::RecordNotFound do
    status(404)
    { error_code: 'resource_not_found' }.to_json
  end
end

Dir.glob('./{models,routes}/*.rb').each { |file| require_relative file }
