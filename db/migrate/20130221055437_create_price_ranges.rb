class CreatePriceRanges < ActiveRecord::Migration
  def change
    create_table :price_ranges do |t|
      t.string :name

      t.timestamps
    end
  end
end
