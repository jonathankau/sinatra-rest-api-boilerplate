ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

ROOT_PATH = File.expand_path('../..', __FILE__)
Dir.chdir(ROOT_PATH) do
  require File.join(ROOT_PATH, 'app')
end

include Rack::Test::Methods

module Rack
  class Response
    def json_body
      JSON.parse(body)
    end
  end
end
