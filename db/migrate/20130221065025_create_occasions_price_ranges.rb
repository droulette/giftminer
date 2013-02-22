class CreateOccasionsPriceRanges < ActiveRecord::Migration
  def change
    create_table :occasions_price_ranges do |t|
      t.references :occasion
      t.references :price_range
    end
    add_index :occasions_price_ranges, :occasion_id
    add_index :occasions_price_ranges, :price_range_id
  end
end
