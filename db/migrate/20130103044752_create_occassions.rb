class CreateOccassions < ActiveRecord::Migration
  def change
    create_table :occassions do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.references :user
      t.string :price_range
      t.string :type_of_gift

      t.timestamps
    end
    add_index :occassions, :user_id
  end
end
