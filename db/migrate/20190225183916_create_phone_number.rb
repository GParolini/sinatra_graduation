class CreatePhoneNumber < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_numbers do |t|
      t.integer :contact_id
      t.string :number
  end
  end
end
