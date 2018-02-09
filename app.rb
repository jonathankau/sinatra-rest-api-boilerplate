require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/param'
require 'json'

class Controller < Sinatra::Base
  helpers Sinatra::Param

  set :show_exceptions, :after_handler

  before do
    content_type :json
  end

  error ActiveRecord::RecordNotFound do
    status(404)
    { error_code: 'resource_not_found' }.to_json
  end
end

Dir.glob('{models,controllers}/*.rb').each do |file|
  require_relative file
end
