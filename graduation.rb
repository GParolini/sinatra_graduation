require "sinatra"

get "/" do
  "My Sinatra graduation project"
end

get "/contacts" do
  erb :index
end
