class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :product
      t.references :user

      t.timestamps
    end
    add_index :recommendations, :product_id
    add_index :recommendations, :user_id
  end
end
