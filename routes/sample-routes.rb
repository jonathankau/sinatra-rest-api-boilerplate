class App < Sinatra::Base
  get '/samples' do
    Models::Sample.all.to_json
  end

  put '/samples' do
    param :text, String, required: true
    sample = Models::Sample.create(sample_text: params[:text])
    sample.to_json
  end

  get '/samples/:id' do
    Models::Sample.find(params[:id]).to_json
  end

  post '/samples/:id' do
    param :text, String, required: true
    sample = Models::Sample.find(params[:id])
    sample.update!(sample_text: params[:text])

    sample.to_json
  end

  delete '/samples/:id' do
    Models::Sample.find(params[:id]).destroy!
    status(200)
  end
end
