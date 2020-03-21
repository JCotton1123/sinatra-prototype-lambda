require 'sinatra'

before do
  if (! request.body.read.empty? and request.body.size > 0)
    request.body.rewind
    @params = Sinatra::IndifferentHash.new
    @params.merge!(JSON.parse(request.body.read))
  end
end

get '/' do
  erb :index
end

get '/hello-world' do
  content_type :json
  { :Output => 'Hello World!' }.to_json
end
