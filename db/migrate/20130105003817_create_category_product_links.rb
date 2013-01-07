class CreateCategoryProductLinks < ActiveRecord::Migration
  def change
    create_table :category_product_links do |t|
      t.references :product_cat
      t.references :product

      t.timestamps
    end
    add_index :category_product_links, :product_cat_id
    add_index :category_product_links, :product_id
  end
end
