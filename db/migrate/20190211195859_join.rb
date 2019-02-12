class Join < ActiveRecord::Migration[5.2]
  def change
    change_table :phone_numbers do |t|
      t.belongs_to :contact
  end
  end
end
