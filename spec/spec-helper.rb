ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'

Dir.chdir(File.dirname(File.dirname(__FILE__))) do
  require_relative '../app'
end

include Rack::Test::Methods

module Rack
  class Response
    def json_body
      JSON.parse(body)
    end
  end
end
