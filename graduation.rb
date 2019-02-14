require "sinatra"
require "sinatra/activerecord"
require "./models/contact"
require "./models/phone_numbers"

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
  @contact= Contact.find(params[:id])
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

put "/contacts/:id/phone_numbers" do
  phone_number = params[:phone_number]
  contact_id = params[:id]
  constructor_parameters = {"phone_number"=>phone_number, "contact_id"=>contact_id}
  @phone_number = PhoneNumber.new(constructor_parameters)
  if phone_number.valid?
    phone_number.save
  else
    puts "Phone number cannot be blank"
  end
  redirect "/contacts"
end
