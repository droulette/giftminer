class ChangePriceTypeToInteger < ActiveRecord::Migration
  def up
    change_column :orders, :total, :integer
    change_column :products, :price, :integer
    change_column :occasions, :price_min, :integer
    change_column :occasions, :price_max, :integer
  end

  def down
    change_column :orders, :total, :decimal
    change_column :products, :price, :decimal
    change_column :occasions, :price_min, :decimal
    change_column :occasions, :price_max, :decimal
  end
end
