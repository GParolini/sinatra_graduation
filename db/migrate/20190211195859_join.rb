class CreateJoinTablePhoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :name, :phone_numbers do |t|
    end
  end
end
