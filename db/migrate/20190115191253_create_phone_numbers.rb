class CreatePhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_numbers do |t|
    t.string :phone_number
    t.integer :contact_id
    end
  end
end
