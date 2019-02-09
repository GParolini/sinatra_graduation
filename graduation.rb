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
  contact = Contact.new(name: params[:name])
  if contact.valid?
    contact.save
  else
    puts "Contact name cannot be blank"
  end
  redirect "/contacts"
end

get "/contacts/:id/display" do
  @contact_phone_numbers= Contact.find(params[:id]).phone_number.all
  erb :contact_display
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

get "/contacts/:id/add" do
  @contact= Contact.find(params[:id])
  erb :contact_add
end

post "/contacts/:id" do
  number = Phone_number.new(params[:id])
  if number.valid?
    number.save
  else
    puts "Phone number cannot be blank"
  end
  redirect "/contacts"
end
