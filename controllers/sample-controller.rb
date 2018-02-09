class SampleController < Controller
  get '/' do
    Models::Sample.all.to_json
  end

  put '/' do
    param :text, String, required: true
    sample = Models::Sample.create(sample_text: params[:text])
    sample.to_json
  end

  get '/:id' do
    Models::Sample.find(params[:id]).to_json
  end

  post '/:id' do
    param :text, String, required: true
    sample = Models::Sample.find(params[:id])
    sample.update!(sample_text: params[:text])

    sample.to_json
  end

  delete '/:id' do
    Models::Sample.find(params[:id]).destroy!
    status(200)
  end
end
