class ApplicationController < Controller
  get '/' do
    param :sample_param, String, required: false

    { hello: 'world' }.to_json
  end

  get '/error' do
    halt 400, { error: 'not found' }.to_json
  end
end
