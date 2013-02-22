class AddMinMaxPriceToOccasion < ActiveRecord::Migration
  def change
    add_column :occasions, :price_max, :decimal, :precision => 8, :scale => 2
    add_column :occasions, :price_min, :decimal, :precision => 8, :scale => 2
  end
end
