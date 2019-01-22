require "sinatra"
require "erb"

get "/" do
  "<html><body><h1>My Sinatra graduation project</h1><h2>How to Build a Contact List Website</h2></body></html>"
end

get "/contacts" do
  erb :index
end
