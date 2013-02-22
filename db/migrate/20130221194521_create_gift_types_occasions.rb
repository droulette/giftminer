class CreateGiftTypesOccasions < ActiveRecord::Migration
  def change
    create_table :gift_types_occasions do |t|
      t.references :gift_type
      t.references :occasion
    end
    add_index :gift_types_occasions, :gift_type_id
    add_index :gift_types_occasions, :occasion_id
  end
end
