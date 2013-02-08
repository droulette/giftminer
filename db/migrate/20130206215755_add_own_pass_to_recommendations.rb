class AddOwnPassToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :pass, :integer
    add_column :recommendations, :own, :integer
  end
end