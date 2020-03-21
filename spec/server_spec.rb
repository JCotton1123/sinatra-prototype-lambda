require 'spec_helper'

# Tests for server.rb
describe 'HelloWorld Service' do
  include Rack::Test::Methods

  it "root endpoint should return successfully" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Hello World")
  end

  it "hello-world endpoint should return successfully" do
    get '/hello-world'
    expect(last_response).to be_ok
    json_result = JSON.parse(last_response.body)
    expect(json_result["Output"]).to eq("Hello World!")
  end
end
