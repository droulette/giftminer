class AddOccassionToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :occassion_id, :integer
  end
end
