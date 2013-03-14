class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :address_type
      t.references :recipient
      t.references :user

      t.timestamps
    end
    add_index :addresses, :recipient_id
    add_index :addresses, :user_id
  end
end
