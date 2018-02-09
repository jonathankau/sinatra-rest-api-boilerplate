require './app.rb'

map '/' do
  run ApplicationController
end

map '/samples' do
  run SampleController
end
