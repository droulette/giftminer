class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :gender
      t.string :age_range

      t.timestamps
    end
  end
end
