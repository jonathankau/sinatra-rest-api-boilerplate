require_relative '../spec-helper'

describe "samples api" do
  it "should return no samples" do
    get '/samples'
    assert last_response.ok?
    assert_equal [], last_response.json_body
  end
end
