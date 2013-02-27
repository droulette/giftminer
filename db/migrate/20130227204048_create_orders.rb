class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.references :product
      t.references :occasion
      t.integer :quantity
      t.decimal :total

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :occasion_id
    add_index :orders, :product_id
  end
end
