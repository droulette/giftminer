class UpdateOccasion < ActiveRecord::Migration
  def up
    remove_column :occasions, :type_of_gift
    remove_column :occasions, :price_range
  end

  def down
    add_column :occasions, :type_of_gift, :string
    add_column :occasions, :price_range, :string
  end
end
