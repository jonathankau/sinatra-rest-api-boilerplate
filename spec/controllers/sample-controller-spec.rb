require_relative '../spec-helper'

def app
  SampleController
end

describe "samples api" do
  it "should return no samples" do
    get '/'
    assert last_response.ok?
    assert_equal [], last_response.json_body
  end
end
