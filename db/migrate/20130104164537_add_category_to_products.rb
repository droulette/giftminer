class AddCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :category, :string
    add_attachment :products, :pic
  end
end
