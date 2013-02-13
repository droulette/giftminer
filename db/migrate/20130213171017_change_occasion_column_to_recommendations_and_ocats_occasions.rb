class ChangeOccasionColumnToRecommendationsAndOcatsOccasions < ActiveRecord::Migration
  def up
    rename_column :recommendations, :occassion_id, :occasion_id
    rename_column :ocats_occassions, :occassion_id, :occasion_id
  end

  def down
    rename_column :recommendations, :occasion_id, :occassion_id
    rename_column :ocats_occassions, :occasion_id, :occassion_id
  end
end
