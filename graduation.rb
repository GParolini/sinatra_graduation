require "sinatra"
require "sinatra/activerecord"
require "./models/contact"

set :database, "sqlite3:development.sqlite3"

get "/contacts" do
  @contacts = Contact.all
  erb :contacts
end


get "/contacts/new" do
  erb :contact_new_form
end

post '/contacts' do
  Contact.create(name: params[:name])
  redirect "/contacts"
end

get "/contacts/:id/edit" do
  @contact= Contact.find(params[:id])
  erb :contact_edit
end

put "/contacts/:id" do
  contact = Contact.find(params[:id])
  contact.update(name: params[:name])
  redirect "/contacts"
end

get "/contacts/:id/delete" do
  @contact= Contact.find(params[:id])
  erb :contact_delete
end

delete "/contacts/:id" do
  contact = Contact.destroy(params[:id])
  redirect "/contacts"
end
